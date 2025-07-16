import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sadasbor_v2/features/account/presentation/pages/dummy_account_page.dart';
import 'package:sadasbor_v2/features/dashboard/presentation/bloc/dashboard/dashboard_page_cubit.dart';
import 'package:sadasbor_v2/features/account/presentation/pages/account_page.dart';
import 'package:sadasbor_v2/features/presensi/presentation/pages/presensi_page.dart';

import '../../../../config/injector/injector.dart';
import '../bloc/posts/dashboard_posts_cubit.dart';
import '../bloc/posts_annoucement/dashboard_posts_annoucement_cubit.dart';
import 'home/home_page.dart';

@RoutePage()
class DashboardPage extends HookWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<DashboardPageCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<DashboardPostsCubit>(),
        ),
      ],
      child: const DashboardPageView(),
    );
  }
}

class DashboardPageView extends HookWidget {
  const DashboardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Pages yang akan di-maintain statenya
    final pages = useMemoized(
          () => [
        const HomePage(), // Gunakan wrapper dengan KeepAlive
        const PresensiPage(),
        const AccountPage(),
      ],
      [],
    );

    // Navigation items configuration
    final navItems = useMemoized(
          () => [
        {
          'label': 'Home',
          'icon': const Icon(Icons.home_filled),
          'appBarTitle': 'Sadasbor',
        },
        {
          'label': 'Presensi',
          'icon': const Icon(Icons.fingerprint),
          'appBarTitle': 'Presensi',
        },
        {
          'label': 'Akun',
          'icon': const Icon(Icons.person_outline),
          'appBarTitle': 'Akun',
        },
      ],
      [],
    );

    return BlocBuilder<DashboardPageCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          appBar: AppBar(
            title: Text(navItems[selectedIndex]['appBarTitle'].toString()),
            backgroundColor: Colors.white,
          ),
          // KUNCI: Gunakan IndexedStack untuk maintain state semua pages
          body: IndexedStack(
            index: selectedIndex,
            children: pages, // Semua pages tetap hidup di memory
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            iconSize: 24,
            elevation: 8,
            currentIndex: selectedIndex,
            enableFeedback: true,
            onTap: (index) {
              context.read<DashboardPageCubit>().changeNav(index);
            },
            items: navItems.map((item) {
              return BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: item['icon'] as Widget,
                ),
                label: item['label'].toString(),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}