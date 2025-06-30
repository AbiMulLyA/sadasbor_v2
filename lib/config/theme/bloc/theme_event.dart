part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class SwitchEv extends ThemeEvent {
  const SwitchEv({
    required this.themeType,
  });

  final ThemeType themeType;

  @override
  String toString() => 'ThemeEvent.SwitchEv';

  @override
  List<Object> get props => [themeType];
}
