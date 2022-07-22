import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/features/signup/data/signup_request.dart';
import 'package:microblog/features/signup/data/signup_response.dart';
import 'package:microblog/features/signup/exceptions/signup_exception.dart';
import 'package:microblog/features/signup/exceptions/signup_execute_exception.dart';

abstract class ISignupRepository {
  Future<Either<SignupExecuteException, SignupResponse>> signupExecute({
    required SignupRequest request,
  });
  Future<Either<SignupException, bool>> userExists({
    required String user,
  });
  Future<Either<SignupException, bool>> emailExists({
    required String email,
  });
}

class SignupRepository implements ISignupRepository {
  final MicroblogDatabase database;

  SignupRepository({
    required this.database,
  });

  @override
  Future<Either<SignupExecuteException, SignupResponse>> signupExecute({
    required SignupRequest request,
  }) async {
    try {
      int response = await (await database.getInstance()).rawInsert(
        'INSERT INTO user (name, email, password) VALUES(?, ?, ?)',
        [
          request.user,
          request.email,
          request.password,
        ],
      );

      return right(
        SignupResponse(
          success: response > 0,
        ),
      );
    } on Exception catch (e) {
      return Left(
        SignupExecuteException(
          cause: e.toString(),
        ),
      );
    } finally {
      database.close();
    }
  }

  @override
  Future<Either<SignupException, bool>> emailExists({
    required String email,
  }) async {
    try {
      List<Map<String, Object?>> resultEmail =
          await (await database.getInstance()).rawQuery(
        'select * from user where email = ?',
        [email],
      );

      if (resultEmail.isNotEmpty) {
        return right(
          true,
        );
      }

      return right(
        false,
      );
    } on Exception catch (e) {
      return left(
        SignupException(
          cause: e.toString(),
        ),
      );
    } finally {
      database.close();
    }
  }

  @override
  Future<Either<SignupException, bool>> userExists(
      {required String user}) async {
    try {
      List<Map<String, Object?>> resultUser =
          await (await database.getInstance()).rawQuery(
        'select * from user where name = ?',
        [user],
      );

      if (resultUser.isNotEmpty) {
        return right(
          true,
        );
      }

      return right(
        false,
      );
    } on Exception catch (e) {
      return left(
        SignupException(
          cause: e.toString(),
        ),
      );
    } finally {
      database.close();
    }
  }
}
