
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sadasbor_v2/core/components/refresher/pull_refresh_component.dart';
import 'package:sadasbor_v2/core/utils/date_time_util.dart';
import 'package:sadasbor_v2/features/dashboard/presentation/bloc/posts/dashboard_posts_cubit.dart';
import '../../../domain/entities/posts/dashboard_posts_entity.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  // Method untuk fetch data - dipindahkan ke level class
  Future<List<DashboardPostsEntity>> _fetchPage(
      BuildContext context,
      int pageKey
      ) async {
    try {
      final cubit = context.read<DashboardPostsCubit>();

      // UI layer hanya call cubit method, tidak langsung ke usecase
      return await cubit.fetchPostsForPagination(
        pageKey: pageKey,
        keywords: null, // Bisa ditambahkan search functionality nanti
      );
    } catch (error) {
      throw Exception('Failed to fetch posts: $error');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final scrollControllerParent = useScrollController();
    final refreshController = useMemoized(
          () => RefreshController(initialRefresh: false),
    );

    // Inisialisasi PagingController dengan proper setup
    final pagingController = useMemoized(
          () => PagingController<int, DashboardPostsEntity>(
        getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : (state.keys?.last ?? 0) + 1,
        fetchPage: (pageKey) => _fetchPage(context, pageKey),
      ),
      [],
    );

    // Handle pull-to-refresh
    Future<void> _onRefresh() async {
      pagingController.refresh();
      refreshController.refreshCompleted();
    }

    // Cleanup PagingController
    useEffect(() {
      return () => pagingController.dispose();
    }, []);

    return BlocListener<DashboardPostsCubit, DashboardPostsState>(
      listener: (context, state) {
        // Optional: Handle state changes if needed
        // Misalnya untuk show snackbar error, dll
      },
      child: Scrollbar(
        controller: scrollControllerParent,
        child: PullRefreshComponent(
          controller: refreshController,
          onRefresh: _onRefresh,
          child: CustomScrollView(
            controller: scrollControllerParent,
            slivers: [
              // Header section - sesuai requirement Anda
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            "Artikel",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print("Lihat Semua diklik");
                              // context.pushRoute(PresensiAllPresensiRoute());
                            },
                            child: Text(
                              "Lihat Semua",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


              // Posts pagination section menggunakan infinite_scroll_pagination
              PagingListener<int, DashboardPostsEntity>(
                controller: pagingController,
                builder: (context, state, fetchNextPage) {
                  return PagedSliverList<int, DashboardPostsEntity>(
                    state: state,
                    fetchNextPage: fetchNextPage,
                    builderDelegate: PagedChildBuilderDelegate<DashboardPostsEntity>(
                      itemBuilder: (context, item, index) => _buildPostItem(item, index),

                      // Error indicator untuk first page
                      firstPageErrorIndicatorBuilder: (context) => _buildErrorIndicator(
                        message: 'Failed to load posts',
                        onRetry: () => pagingController.refresh(),
                      ),

                      // Error indicator untuk next pages
                      newPageErrorIndicatorBuilder: (context) => _buildErrorIndicator(
                        message: 'Failed to load more posts',
                        onRetry: () => {},
                      ),

                      // Loading indicator untuk first page
                      firstPageProgressIndicatorBuilder: (context) =>
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: CircularProgressIndicator(),
                        ),
                      ),

                      // Loading indicator untuk next pages
                      newPageProgressIndicatorBuilder: (context) =>
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      ),

                      // No items indicator
                      noItemsFoundIndicatorBuilder: (context) =>
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: Column(
                            children: [
                              Icon(
                                Icons.inbox_outlined,
                                size: 64,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'No posts found',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // No more items indicator (optional)
                      noMoreItemsIndicatorBuilder: (context) =>
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            'Tidak ada lagi Artikel',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostItem(DashboardPostsEntity item, int index) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image Section - Di sebelah kiri
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: item.featureImage ?? '',
                height: 100,
                width: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 100,
                  width: 80,
                  color: Colors.grey[200],
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 100,
                  width: 80,
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.broken_image,
                    size: 32,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Content Section - Di sebelah kanan
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Time Section
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        IndonesianDateTimeUtil.formatPostDate(item.postDate ?? ''),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Title Section
                  Text(
                    item.postTitle ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  // Category and Author Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Category
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.blue[200]!,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          item.categories?[0] ?? '',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      // Author
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person,
                            size: 14,
                            color: Colors.blueAccent,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item.authorName ?? '',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildErrorIndicator({
    required String message,
    required VoidCallback onRetry,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}