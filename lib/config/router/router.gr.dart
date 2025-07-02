// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardPage();
    },
  );
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [PresensiAllPresensiPage]
class PresensiAllPresensiRoute extends PageRouteInfo<void> {
  const PresensiAllPresensiRoute({List<PageRouteInfo>? children})
    : super(PresensiAllPresensiRoute.name, initialChildren: children);

  static const String name = 'PresensiAllPresensiRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PresensiAllPresensiPage();
    },
  );
}

/// generated route for
/// [PresensiDetailPage]
class PresensiDetailRoute extends PageRouteInfo<void> {
  const PresensiDetailRoute({List<PageRouteInfo>? children})
    : super(PresensiDetailRoute.name, initialChildren: children);

  static const String name = 'PresensiDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PresensiDetailPage();
    },
  );
}

/// generated route for
/// [PresensiWriteAttendancePage]
class PresensiWriteAttendanceRoute
    extends PageRouteInfo<PresensiWriteAttendanceRouteArgs> {
  PresensiWriteAttendanceRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
         PresensiWriteAttendanceRoute.name,
         args: PresensiWriteAttendanceRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'PresensiWriteAttendanceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PresensiWriteAttendanceRouteArgs>();
      return PresensiWriteAttendancePage(key: args.key, title: args.title);
    },
  );
}

class PresensiWriteAttendanceRouteArgs {
  const PresensiWriteAttendanceRouteArgs({this.key, required this.title});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'PresensiWriteAttendanceRouteArgs{key: $key, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PresensiWriteAttendanceRouteArgs) return false;
    return key == other.key && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode;
}
