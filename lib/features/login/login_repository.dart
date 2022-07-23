import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/features/login/data/login_request.dart';
import 'package:microblog/features/login/data/login_response.dart';
import 'package:microblog/features/login/exceptions/login_execute_exception.dart';

abstract class ILoginRepository {
  Future<Either<LoginExecuteException, LoginResponse>> loginExecute({
    required LoginRequest request,
  });
}

class LoginRepository implements ILoginRepository {
  final MicroblogDatabase database;

  LoginRepository({
    required this.database,
  });

  @override
  Future<Either<LoginExecuteException, LoginResponse>> loginExecute({
    required LoginRequest request,
  }) async {
    try {
      final byEmail = await (await database.getInstance()).rawQuery(
        'SELECT * FROM user WHERE email = ? AND password = ?',
        [
          request.user,
          request.password,
        ],
      );

      final byUsername = await (await database.getInstance()).rawQuery(
        'SELECT * FROM user WHERE name = ? AND password = ?',
        [
          request.user,
          request.password,
        ],
      );

      if (byEmail.isEmpty && byUsername.isEmpty) {
        return Left(
          LoginExecuteException(
            cause: 'invalid_credentials'.tr,
          ),
        );
      }

      return right(
        LoginResponse(
          success: true,
          user: (byUsername[0]['name'] ?? byEmail[0]['name']).toString(),
          email: (byUsername[0]['email'] ?? byEmail[0]['email']).toString(),
        ),
      );
    } on Exception catch (e) {
      return Left(
        LoginExecuteException(
          cause: e.toString(),
        ),
      );
    } finally {
      database.close();
    }
  }
}
