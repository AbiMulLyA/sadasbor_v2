part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class InitialSt extends AuthState {
  const InitialSt();

  @override
  String toString() => 'AuthState.InitialSt';

  @override
  List<Object> get props => [];
}

class AuthenticatedSt extends AuthState {
  const AuthenticatedSt();

  @override
  String toString() => 'AuthState.AuthenticatedSt';

  @override
  List<Object> get props => [];
}

class AuthenticatedDeepLinkSt extends AuthState {
  const AuthenticatedDeepLinkSt();

  @override
  String toString() => 'AuthState.AuthenticatedDeepLinkSt';

  @override
  List<Object> get props => [];
}

class UnauthenticatedSt extends AuthState {
  const UnauthenticatedSt();

  @override
  String toString() => 'AuthState.UnauthenticatedSt';

  @override
  List<Object> get props => [];
}

class UnauthenticatedBoardSt extends AuthState {
  const UnauthenticatedBoardSt();

  @override
  String toString() => 'AuthState.UnauthenticatedBoardSt';

  @override
  List<Object> get props => [];
}

class LoadingInSt extends AuthState {
  const LoadingInSt();

  @override
  String toString() => 'AuthState.LoadingInSt';

  @override
  List<Object> get props => [];
}

class LoadingDeepLinkSt extends AuthState {
  const LoadingDeepLinkSt();

  @override
  String toString() => 'AuthState.LoadingDeepLinkSt';

  @override
  List<Object> get props => [];
}

class LoadingOutSt extends AuthState {
  const LoadingOutSt();

  @override
  String toString() => 'AuthState.LoadingOutSt';

  @override
  List<Object> get props => [];
}
