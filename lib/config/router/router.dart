import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/dashboard/presentation/pages/presensi/presensi_write_attendance_page.dart';
import '../../main.dart';

part 'router.gr.dart';

GlobalKey<NavigatorState> routerNavigator = GlobalKey<NavigatorState>();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  AppRouter() : super(navigatorKey: routerNavigator);
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: MainRoute.page, initial: true),
    AutoRoute(page: PresensiWriteAttendanceRoute.page),
  ];
}
