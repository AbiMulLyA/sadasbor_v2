import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../utils/auth_util.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.authUtil,
  }) : super(const InitialSt());

  final AuthUtil authUtil;

  @override
  Stream<AuthState> mapEventToState(
      AuthEvent event,
      ) async* {
    if (event is AppStartedEv || event is DeepLinkEv) {
      final bool hasToken = await authUtil.hasAccessToken();
      final bool hasSeenOnBoard = await authUtil.hasSeenOnBoard();

      if (hasToken) {
        if (event is AppStartedEv) {
          yield const AuthenticatedSt();
        } else {
          yield const LoadingDeepLinkSt();
          await Future.delayed(const Duration(seconds: 1));
          yield const AuthenticatedDeepLinkSt();
        }
      } else {
        if (hasSeenOnBoard) {
          yield const UnauthenticatedSt();
        } else {
          yield const UnauthenticatedBoardSt();
        }
      }
    }

    if (event is OnboardEv) {
      yield const UnauthenticatedSt();
    }

    if (event is LoggedInEv) {
      yield const LoadingInSt();

      await authUtil.setAccessToken(event.token);
      // await authUtil.setUserData(event.userData);
      // await authUtil.setUserPwd(event.userPwd);

      if (event.hasSeebOnBoard) {
        await authUtil.setSeenOnBoard(value: event.hasSeebOnBoard);
      }

      //* Set Ref Data
      //await authRepo.setReference(event.listData);
      yield const AuthenticatedSt();
    }

    if (event is LoggedOutEv) {
      yield const LoadingOutSt();
      await authUtil.deleteLogout();
      yield const UnauthenticatedSt();
    }
  }
}
