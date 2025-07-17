import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sadasbor_v2/features/account/presentation/pages/dummy_account_page.dart';
import 'package:sadasbor_v2/features/dashboard/presentation/bloc/dashboard/dashboard_page_cubit.dart';
import 'package:sadasbor_v2/features/presensi/presentation/pages/presensi_page.dart';

import '../../../../config/injector/injector.dart';
import '../../../account/presentation/pages/account_page.dart';
import '../bloc/posts/dashboard_posts_cubit.dart';
import '../bloc/posts_annoucement/dashboard_posts_annoucement_cubit.dart';
import 'animated_navigation_scaffold.dart';
import 'home/home_page.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<DashboardPageCubit>()),
        BlocProvider(create: (_) => getIt<DashboardPostsCubit>()),
        BlocProvider(create: (_) => getIt<DashboardPostsAnnouncementCubit>()),
      ],
      child: const DashboardPageView(),
    );
  }
}

class DashboardPageView extends HookWidget {
  const DashboardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Animation controller untuk transitions
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    // Pages yang akan di-maintain statenya
    final pages = useMemoized(
      () => [const HomePage(), const PresensiPage(), const AccountPage()],
      [],
    );

    // Navigation items configuration
    final navItems = useMemoized(
      () => [
        {
          'label': 'Beranda',
          'icon': const Icon(Icons.home_filled),
          'appBarTitle': Image.asset(
            "assets/logo/sadasbor-logo.png",
            width: 120,
            height: 50,
          ),
        },
        {
          'label': 'Presensi',
          'icon': const Icon(Icons.fingerprint),
          'appBarTitle': Text(
            'Presensi',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        },
        {
          'label': 'Akun',
          'icon': const Icon(Icons.person_outline),
          'appBarTitle': Text(
            'Akun',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        },
      ],
      [],
    );

    // Start animation saat first build
    useEffect(() {
      animationController.forward();
      return null;
    }, []);

    return BlocListener<DashboardPageCubit, int>(
      listener: (context, selectedIndex) {
        // Trigger animation saat tab berubah
        animationController.reset();
        animationController.forward();
      },
      child: BlocBuilder<DashboardPageCubit, int>(
        builder: (context, selectedIndex) {
          return AnimatedNavigationScaffold(
            selectedIndex: selectedIndex,
            pages: pages,
            navItems: navItems,
            animationController: animationController,
            onIndexChanged: (index) {
              context.read<DashboardPageCubit>().changeNav(index);
            },
          );
        },
      ),
    );
  }
}