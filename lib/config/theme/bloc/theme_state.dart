part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.themeType, this.themeData});

  final String themeType;
  final ThemeData? themeData;

  @override
  List<Object> get props => [themeType];
}
