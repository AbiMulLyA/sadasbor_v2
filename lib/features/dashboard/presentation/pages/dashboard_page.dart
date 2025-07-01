import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sadasbor_v2/features/dashboard/presentation/bloc/dashboard/dashboard_page_cubit.dart';
import 'package:sadasbor_v2/features/account/presentation/pages/account_page.dart';
import 'package:sadasbor_v2/features/presensi/presentation/pages/presensi_page.dart';

import 'home/home_page.dart';

@RoutePage()
class DashboardPage extends HookWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardPageCubit(),
      child: const DashboardPageView(),
    );
  }
}

class DashboardPageView extends HookWidget {
  const DashboardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // _navItems now correctly defines the pages, labels, and icons.
    final navItems = useMemoized(
      () => [
        {
          'page': const HomePage(),
          // Pastikan HomePage adalah widget yang valid
          'label': 'Home',
          'icon': const Icon(Icons.home_filled),
          'appBarTitle': 'Sadasbor',
          // AppBar title for Home
        },
        {
          'page': const PresensiPage(),
          // Pastikan PresensiPage adalah widget yang valid
          'label': 'Presensi',
          'icon': const Icon(Icons.fingerprint),
          'appBarTitle': 'Presensi',
          // AppBar title for Presensi
        },
        {
          'page': const AccountPage(),
          // Pastikan AccountPage adalah widget yang valid
          'label': 'Akun',
          'icon': const Icon(Icons.person_outline),
          'appBarTitle': 'Akun',
          // AppBar title for Akun
        },
      ],
    );

    final theme = Theme.of(context);

    return BlocBuilder<DashboardPageCubit, int>(
      builder: (context, selectedIndex) {
        // state is the selectedIndex
        return Scaffold(
          appBar: AppBar(
            title: Text(navItems[selectedIndex]['appBarTitle'].toString()),
            backgroundColor: Colors.white, // Example color
          ),
          body: navItems[selectedIndex]['page'] as Widget,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            iconSize: 24,
            elevation: 8,
            // Adjusted for typical M3 elevation
            currentIndex: selectedIndex,
            enableFeedback: true,
            onTap: (index) {
              context.read<DashboardPageCubit>().changeNav(index);
            },
            items: navItems.map((item) {
              return BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.only(top: 5),
                  // Consider if this padding is still needed
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
