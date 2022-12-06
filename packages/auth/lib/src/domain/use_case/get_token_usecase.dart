import 'package:auth/src/domain/repositories/auth_repositories.dart';
import 'package:common_dependency/common_dependency.dart';

class GetTokenUseCase {
  final AuthRepositories repositories;

  GetTokenUseCase(this.repositories);
  Future<Either<Failure, TokenModel?>> call() async {
    return await repositories.getToken();
  }
}
