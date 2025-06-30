import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AutoRouteObserverUtils extends AutoRouterObserver {
  static String lastRoute = '';

  @override
  void didPush(Route route, Route? previousRoute) {
    if (kDebugMode) {
      log('New route pushed: ${route.settings.name}', name: 'AutoRoute');
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (kDebugMode) {
      log('Route popped: ${route.settings.name}', name: 'AutoRoute');
    }
    lastRoute = route.settings.name ?? '';
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (kDebugMode) {
      log('Route replaced: ${newRoute?.settings.name}', name: 'AutoRoute');
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if (kDebugMode) {
      log('Route removed: ${route.settings.name}', name: 'AutoRoute');
    }
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    if (kDebugMode) {
      log('User started gesture: ${route.settings.name}', name: 'AutoRoute');
    }
  }

  @override
  void didStopUserGesture() {
    if (kDebugMode) {
      log('User stopped gesture', name: 'AutoRoute');
    }
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    if (kDebugMode) {
      log('Tab route visited: ${route.name}', name: 'AutoRoute');
    }
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    if (kDebugMode) {
      log('Tab route re-visited: ${route.name}', name: 'AutoRoute');
    }
  }
}
