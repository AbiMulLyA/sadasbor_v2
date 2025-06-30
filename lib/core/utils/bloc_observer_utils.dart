import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class BlocObserverUtils extends BlocObserver {
  const BlocObserverUtils(HydratedStorage hydratedStorage) : super();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Bloc) {
      if (kDebugMode) {
        // debugPrint(change.toString());
      }
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      // debugPrint(transition.toString());
    }
  }

  @override
  void onError(BlocBase bloc, dynamic error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      log('Bloc error: ${bloc.runtimeType}',
          name: 'BlocObserver', error: error, stackTrace: stackTrace);
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      log('Bloc closed: ${bloc.runtimeType}', name: 'BlocObserver');
    }
  }
}
