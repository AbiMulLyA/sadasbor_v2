import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/router/router.dart';


/// A utility class that manages the addition and removal of blocs.
class BlocWrapperUtil {
  BlocWrapperUtil(this._appRouter);
  final AppRouter _appRouter;

  final Set<Map<String, Object>> _mapBloc = <Map<String, Object>>{};

  /// Subscribes to the route listener of the app router and removes the bloc.
  void subscribeRouteListener() {
    _appRouter.addListener(_removeBloc);
  }

  void removeListener() {
    _appRouter.removeListener(_removeBloc);
  }

  /// Removes the bloc from the [_mapBloc] based on the current route name.
  ///
  /// The bloc is removed if its key matches the current route name.
  /// If the current route is the only route in the stack, all blocs are removed.
  /// After removing the bloc, it logs the removal by calling [showLog] function
  /// with the bloc's name.
  void _removeBloc() {
    final routeNames = _appRouter.stackData.map((e) => e.name).toList();

    // If the current route is the only route in the stack, remove all blocs
    if (routeNames.length == 1) {
      for (final element in _mapBloc) {
        showLog(
          isAdd: false,
          name: element.values.first.runtimeType.toString(),
        );
      }

      _mapBloc.clear();

      return;
    }

    _mapBloc.removeWhere((element) {
      bool isRemoved = false;
      for (final routeName in routeNames) {
        isRemoved = !element.keys.contains(routeName);

        if (isRemoved == false) {
          break;
        }
      }

      if (isRemoved) {
        showLog(
          isAdd: false,
          name: element.values.first.runtimeType.toString(),
        );
      }
      return isRemoved;
    });
  }

  /// Checks if a bloc of type [T] exists in the [_mapBloc].
  ///
  /// Returns `true` if a bloc of type [T] exists, otherwise `false`.
  bool checkBloc<T>() {
    try {
      return _mapBloc.any(
            (bloc) => bloc.values.first.runtimeType.toString() == T.toString(),
      );
    } catch (error) {
      return false;
    }
  }

  /// Returns an instance of the specified bloc type [T].
  ///
  /// Throws an exception if the bloc of type [T] is not found.
  T getBloc<T>() {
    try {
      final data = _mapBloc.lastWhere(
            (element) =>
        element.values.first.runtimeType.toString() == T.toString(),
      );
      return data.values.first as T;
    } catch (_) {
      throw Exception("${T.toString()} is not found");
    }
  }

  /// Adds a list of [blocs] to the global state.
  ///
  /// This method emits a loading state before adding each bloc to the global state.
  /// If the bloc is of type [Bloc], it is added to the [_mapBloc] with the current app router name as the key.
  /// If the bloc is of type [Cubit], it is also added to the [_mapBloc] with the current app router name as the key.
  /// After adding all the blocs, it emits a success state.
  void addBloc(List<Object> blocs) {
    for (final bloc in blocs) {
      // Remove the old bloc on the list
      final oldBloc = _mapBloc
          .where((e) =>
      e.keys.contains(_appRouter.current.name) &&
          e.values.contains(bloc))
          .toList();

      if (oldBloc.isNotEmpty) {
        _mapBloc.removeAll(oldBloc);
        for (final element in oldBloc) {
          showLog(
            isAdd: false,
            name: element.values.first.runtimeType.toString(),
          );
        }
      }

      if (bloc is Bloc) {
        final test = _mapBloc
            .where((e) =>
        e.keys.contains(_appRouter.current.name) &&
            e.values.contains(bloc))
            .toList();
        debugPrint('test: $test');
        _mapBloc.add({_appRouter.current.name: bloc});
        showLog(name: bloc.runtimeType.toString());
      }

      if (bloc is Cubit) {
        _mapBloc.add({_appRouter.current.name: bloc});
        showLog(name: bloc.runtimeType.toString());
      }
    }
  }

  /// Shows a log message indicating the addition or removal of a bloc.
  ///
  /// If [isAdd] is `true`, the log message will indicate that a bloc with the given [name] has been added.
  /// If [isAdd] is `false`, the log message will indicate that a bloc with the given [name] has been removed.
  ///
  /// This method will only execute if the app is running in debug mode.
  void showLog({bool isAdd = true, required String name}) {
    if (kDebugMode) {
      if (isAdd) {
        log('Bloc added: $name', name: 'BlocWrapperUtil');
      } else {
        log('Bloc removed: $name', name: 'BlocWrapperUtil');
      }
    }
  }
}
