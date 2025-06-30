part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEv extends AuthEvent {
  const AppStartedEv();

  @override
  String toString() => 'AuthEvent.AppStartedEv';

  @override
  List<Object> get props => [];
}

class LoggedInEv extends AuthEvent {
  const LoggedInEv({
    required this.token,
    required this.userData,
    required this.hasSeebOnBoard,
    required this.userPwd,
    this.refData,
  }) : super();

  final String token;
  final String userData;
  final bool hasSeebOnBoard;
  final Map<String, dynamic> userPwd;
  final Map<String, dynamic>? refData;

  @override
  String toString() => 'AuthEvent.LoggedInEv { token: $token }';

  @override
  List<Object> get props => [token, userData, hasSeebOnBoard];
}

class LoggedOutEv extends AuthEvent {
  @override
  String toString() => 'AuthEvent.LoggedOutEv';

  @override
  List<Object> get props => [];
}

class OnboardEv extends AuthEvent {
  @override
  String toString() => 'AuthEvent.OnboardEv';

  @override
  List<Object> get props => [];
}

class DeepLinkEv extends AuthEvent {
  @override
  String toString() => 'AuthEvent.DeepLinkEv';

  @override
  List<Object> get props => [];
}
