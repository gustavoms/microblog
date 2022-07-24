import 'package:dartz/dartz.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/features/login/data/login_entity.dart';
import 'package:microblog/features/login/data/login_request.dart';
import 'package:microblog/features/login/data/login_response.dart';
import 'package:microblog/features/login/exceptions/login_execute_exception.dart';
import 'package:microblog/features/login/login_repository.dart';

class LoginExecuteUseCase {
  final ILoginRepository repository;
  final Storage storage;

  LoginExecuteUseCase({
    required this.repository,
    required this.storage,
  });

  Future<Either<LoginExecuteException, LoginResponse>> call({
    required LoginEntity data,
  }) async {
    final response = await repository.loginExecute(
      request: LoginRequest(
        user: data.user,
        password: data.password,
      ),
    );

    response.fold(
      (l) => null,
      (r) async {
        await storage.setUserName(r.user);
        await storage.setUserEmail(r.email);
        await storage.setUserId(r.id);
      },
    );

    return response;
  }
}
