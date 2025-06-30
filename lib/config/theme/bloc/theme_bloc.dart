import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/theme/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

@lazySingleton
class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
    ThemeState(
      themeType: 'ThemeType.defaults',
      themeData: accurateTheme[ThemeType.defaults],
    ),
  ) {
    on<SwitchEv>((event, emit) async {
      emit(
        ThemeState(
          themeType: event.themeType.toString(),
          themeData: accurateTheme[event.themeType],
        ),
      );
    });
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    return ThemeState(
      themeType: json['themeType'].toString(),
      themeData: _mapStringToData(json['themeType'].toString()),
    );
  }

  @override
  Map<String, dynamic> toJson(ThemeState state) {
    return {
      'themeType':
      state.themeData != null ? _mapDataToString(state.themeData!) : null,
    };
  }

  ThemeData? _mapStringToData(String themeType) {
    if (themeType == 'ThemeType.light') {
      return accurateTheme[ThemeType.light];
    } else if (themeType == 'ThemeType.dark') {
      return accurateTheme[ThemeType.dark];
    } else {
      return accurateTheme[ThemeType.defaults];
    }
  }

  String _mapDataToString(ThemeData themeData) {
    if (themeData == accurateTheme[ThemeType.light]) {
      return 'ThemeType.light';
    } else if (themeData == accurateTheme[ThemeType.dark]) {
      return 'ThemeType.dark';
    } else {
      return 'ThemeType.defaults';
    }
  }
}
