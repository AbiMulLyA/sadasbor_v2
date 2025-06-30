import 'package:equatable/equatable.dart';

import '../utils/error_util.dart';
import '../utils/global_util.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    required this.type,
  });

  final String message;
  final dynamic type;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}

//* RemoteFailure
class RemoteFailure extends Failure {
  const RemoteFailure({
    required String message,
    required dynamic type,
  }) : super(
    message: message,
    type: type,
  );
}

//* NoInternetFailure
class NoInternetFailure extends Failure {
  const NoInternetFailure()
      : super(
    message: 'kNoInternet',
    type: ErrorType.noInternet,
  );
}

//* AuthFailure
class AuthFailure extends Failure {
  const AuthFailure()
      : super(
    message: 'Email/No. Handphone dan Password tidak tepat',
    type: ErrorType.authError,
  );
}

//* AuthFailure
class SessionFailure extends Failure {
  const SessionFailure()
      : super(
    message: 'Sesi login anda telah berakhir',
    type: ErrorType.sessionError,
  );
}

//* AuthFailure
class ServerFailure extends Failure {
  const ServerFailure()
      : super(
    message: 'Server Error',
    type: ErrorType.sessionError,
  );
}

//* TimeoutFailure
class TimeoutFailure extends Failure {
  const TimeoutFailure({
    String? message,
  }) : super(
    message: message ??' kTimeoutError',
    type: ErrorType.timeoutError,
  );
}

//* UnknownFailure
class UnknownFailure extends Failure {
  const UnknownFailure()
      : super(
    message: 'kUnknownError',
    type: ErrorType.unKnownError,
  );
}

//* LocalFailure
class LocalFailure extends Failure {
  const LocalFailure({
    dynamic type,
  }) : super(
    message: 'kLocalError',
    type: type,
  );
}

//* BackendFailure
class BackendFailure extends Failure {
  const BackendFailure({
    String? message,
  }) : super(
    message: message ?? '',
    type: ErrorType.backendError,
  );
}

//* BackendFailure
class EmptyFailure extends Failure {
  const EmptyFailure({
    String? message,
  }) : super(
    message: message ?? '',
    type: ErrorType.backendError,
  );
}

//* BackendFailure
class DtoParsingFailure extends Failure {
  const DtoParsingFailure({
    String? message,
  }) : super(
    message: message ?? '',
    type: ErrorType.backendError,
  );
}
