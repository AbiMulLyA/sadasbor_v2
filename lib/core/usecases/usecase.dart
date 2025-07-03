import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

abstract class UseCaseTwoParam<T, P, O> {
  Future<Either<Failure, T>> call(P params, O secondParams);
}

class NoParam extends Equatable {
  @override
  List<Object> get props => [];
}
