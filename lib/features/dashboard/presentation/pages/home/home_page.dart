import 'package:flutter/material.dart' hide CardTheme;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sadasbor_v2/config/theme/theme.dart';
import 'package:sadasbor_v2/core/components/refresher/pull_refresh_component.dart';
import 'package:sadasbor_v2/core/utils/global_util.dart';
import 'package:sadasbor_v2/features/dashboard/domain/entities/posts/dashboard_posts_entity.dart';
import 'package:sadasbor_v2/features/dashboard/presentation/bloc/posts/dashboard_posts_cubit.dart';
import 'package:sadasbor_v2/features/dashboard/presentation/pages/home/home_annoucement_slider_view.dart';
import 'package:sadasbor_v2/features/dashboard/presentation/pages/home/home_article_error_indicator_view.dart';
import 'package:sadasbor_v2/features/dashboard/presentation/pages/home/home_article_item_view.dart';
import 'package:sadasbor_v2/features/dashboard/presentation/pages/home/home_article_shimmer_view.dart';

import '../../bloc/posts_annoucement/dashboard_posts_annoucement_cubit.dart';
import '../../components/grid_menu_icon_component.dart';
import 'home_annoucement_slider_shimmer_view.dart';


class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<List<DashboardPostsEntity>> _fetchPage(
    BuildContext context,
    int pageKey,
  ) async {
    final cubit = context.read<DashboardPostsCubit>();
    return cubit.fetchPostsForPagination(pageKey: pageKey);
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final refreshController = useMemoized(() => RefreshController());
    final greeting = GlobalUtil.greatingText(context);
    final cardTheme = GlobalUtil.getCardTheme();

    final pagingController = useMemoized(
      () => PagingController<int, DashboardPostsEntity>(
        getNextPageKey: (state) =>
            state.lastPageIsEmpty ? null : (state.keys?.last ?? 0) + 1,
        fetchPage: (pageKey) => _fetchPage(context, pageKey),
      ),
    );

    useEffect(() {
      context.read<DashboardPostsAnnouncementCubit>().fetchPostsAnnoucement();
      return pagingController.dispose;
    }, []);

    Future<void> onRefresh() async {
      context.read<DashboardPostsAnnouncementCubit>().fetchPostsAnnoucement();
      pagingController.refresh();
      refreshController.refreshCompleted();
    }

    final menuItems = <GridMenuItem>[
      GridMenuItem(
        icon: Icons.calendar_today,
        label: 'Presensi',
        onTap: _onPresensiTap,
      ),
      GridMenuItem(icon: Icons.receipt_long, label: 'LTH', onTap: _onLthTap),
      GridMenuItem(icon: Icons.upcoming, label: 'KGB', isDisabled: true),
      GridMenuItem(icon: Icons.upcoming, label: 'Cuti', isDisabled: true),
      /*      GridMenuItem(icon: Icons.calendar_today, label: 'Presensi', onTap: _onPresensiTap),
      GridMenuItem(icon: Icons.receipt_long, label: 'LTH', onTap: _onLthTap),
      GridMenuItem(icon: Icons.upcoming, label: 'KGB', isDisabled: true),*/
    ];

    return Scrollbar(
      controller: scrollController,
      child: PullRefreshComponent(
        controller: refreshController,
        onRefresh: onRefresh,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefLeftRight,
                  vertical: 16,
                ),
                child: _buildGreetingCard(cardTheme, greeting),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefLeftRight,
                  vertical: 8,
                ),
                child: GridMenuIconComponent(
                  menuItems: menuItems,
                  onLihatSemua: _onLihatSemua,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Pengumuman',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            BlocBuilder<
              DashboardPostsAnnouncementCubit,
              DashboardPostsAnnoucementState
            >(
              builder: (context, state) {
                return switch (state) {
                  DashboardPostsAnnoucementLoading() => SliverToBoxAdapter(
                    child: HomeAnnoucementSliderShimmerView(),
                  ),
                  DashboardPostsAnnoucementSuccess() => SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: kDefLeftRight),
                      child: HomeAnnouncementSliderView(
                        announcements: context
                            .read<DashboardPostsAnnouncementCubit>()
                            .getAnnouncements(),
                        onSelengkapnyaTap: (announcement) {
                          // Handle tap action
                          print(
                            'Selengkapnya tapped for: ${announcement.postTitle}',
                          );
                          // Navigasi ke detail page
                          // context.p[ushRoute(DetailRoute(slug: announcement.slug));
                        },
                      ),
                    ),
                  ),

                  // TODO: Handle this case.
                  DashboardPostsAnnoucementState() => SliverToBoxAdapter(
                    child: SizedBox.shrink(),
                  ),
                };
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Artikel',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            PagingListener<int, DashboardPostsEntity>(
              controller: pagingController,
              builder: (context, state, fetchNextPage) {
                return PagedSliverList<int, DashboardPostsEntity>(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate:
                      PagedChildBuilderDelegate<DashboardPostsEntity>(
                        itemBuilder: (context, item, index) =>
                            HomeArticleItemView(item: item, index: index),
                        firstPageErrorIndicatorBuilder: (context) =>
                            HomeArticleErrorIndicatorView(
                              message: 'Failed to load posts',
                              onRetry: pagingController.refresh,
                            ),
                        newPageErrorIndicatorBuilder: (context) =>
                            HomeArticleErrorIndicatorView(
                              message: 'Failed to load more posts',
                              onRetry: () {},
                            ),
                        firstPageProgressIndicatorBuilder: (context) =>
                            HomeArticleShimmerView(itemCount: 5),
                        newPageProgressIndicatorBuilder: (context) =>
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(child: CircularProgressIndicator()),
                            ),
                        noItemsFoundIndicatorBuilder: (context) => const Center(
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
                        noMoreItemsIndicatorBuilder: (context) => const Padding(
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
    );
  }

  Widget _buildGreetingCard(CardTheme cardTheme, String greeting) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: cardTheme.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: cardTheme.gradientColors[0].withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(cardTheme.icon, size: 24, color: cardTheme.textColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo, $greeting',
                  style: TextStyle(
                    color: cardTheme.subTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Ahmad Abi Mulya',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: cardTheme.textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _onPresensiTap() => debugPrint('Presensi menu tapped');

void _onLthTap() => debugPrint('LTH menu tapped');

void _onLihatSemua() => debugPrint('Lihat Semua menu tapped');
