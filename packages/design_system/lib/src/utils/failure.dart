import 'package:common_dependency/common_dependency.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class DomainFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UseCaseFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnAuthorizedFailure extends Failure {
  @override
  List<Object?> get props => [];
}
