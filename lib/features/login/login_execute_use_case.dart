import 'package:dartz/dartz.dart';
import 'package:microblog/features/login/data/login_entity.dart';
import 'package:microblog/features/login/data/login_request.dart';
import 'package:microblog/features/login/data/login_response.dart';
import 'package:microblog/features/login/exceptions/login_execute_exception.dart';
import 'package:microblog/features/login/login_repository.dart';

class LoginExecuteUseCase {
  final ILoginRepository repository;

  LoginExecuteUseCase({
    required this.repository,
  });

  Future<Either<LoginExecuteException, LoginResponse>> call({
    required LoginEntity data,
  }) async {
    return await repository.loginExecute(
      request: LoginRequest(
        user: data.user,
        password: data.password,
      ),
    );
  }
}
