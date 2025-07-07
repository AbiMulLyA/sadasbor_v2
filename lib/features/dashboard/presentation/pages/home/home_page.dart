import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sadasbor_v2/features/dashboard/presentation/bloc/posts/dashboard_posts_cubit.dart';

import '../../../domain/entities/posts/dashboard_posts_entity.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Use useState to store the controller
    final pagingController =
        useState<PagingController<int, DashboardPostsEntity>?>(null);

    // 2. Define _fetchPage function
    Future<List<DashboardPostsEntity>> _fetchPage(int pageKey) async {
      try {
        final controller = pagingController.value;
        if (controller == null) {
          throw Exception('Controller not initialized');
        }

        // Call cubit method with currentState and updateState callback
        await context.read<DashboardPostsCubit>().getPosts(
          pageKey: pageKey,
          currentState: controller.value,
          // Pass current state
          updateState: (newState) {
            // Update controller state using the new v5 approach
            controller.value = newState;
          },
          retryData: pageKey == 1,
          // First page or retry
          keywords: null, // Add search functionality later if needed
        );

        // Extract items from the updated state
        final updatedState = controller.value;
        if (updatedState.pages != null && updatedState.pages!.isNotEmpty) {
          return updatedState.pages!.last;
        } else {
          return [];
        }
      } catch (error) {
        // Throw error to be handled by PagingController
        throw Exception('Failed to fetch posts: $error');
      }
    }

    // 3. Initialize controller in useEffect
    useEffect(() {
      pagingController.value = PagingController<int, DashboardPostsEntity>(
        getNextPageKey: (state) =>
            state.lastPageIsEmpty ? null : (state.keys?.last ?? 0) + 1,
        fetchPage: (pageKey) => _fetchPage(1),
      );

      return () {
        // Cleanup: dispose controller when widget is disposed
        pagingController.value?.dispose();
      };
    },const []); // Empty dependency array

    // 4. Listen to cubit state changes for error handling
    return BlocListener<DashboardPostsCubit, DashboardPostsState>(
      listener: (context, state) {
        // state.when(
        //   initial: () {},
        //   loading: () {},
        //   success: (data) {
        //     // Success is handled in the fetchPage method
        //   },
        //   failed: (failure) {
        //     // Handle error - this will be caught by the PagingController
        //     // You can also show additional error UI here if needed
        //   },
        // );
      },
      child: PagingListener<int, DashboardPostsEntity>(
        controller: pagingController.value!,
        builder: (context, state, fetchNextPage) =>
            PagedListView<int, DashboardPostsEntity>(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) => Container(),
              ),
            ), // Your UI will go here
      ),
    );
  }
}
