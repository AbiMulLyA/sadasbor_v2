// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

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
/// [MyHomePage]
class MyHomeRoute extends PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({Key? key, required String title, List<PageRouteInfo>? children})
    : super(
        MyHomeRoute.name,
        args: MyHomeRouteArgs(key: key, title: title),
        initialChildren: children,
      );

  static const String name = 'MyHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MyHomeRouteArgs>();
      return MyHomePage(key: args.key, title: args.title);
    },
  );
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({this.key, required this.title});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'MyHomeRouteArgs{key: $key, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MyHomeRouteArgs) return false;
    return key == other.key && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode;
}
