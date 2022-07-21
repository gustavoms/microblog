import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/features/signup/data/signup_request.dart';
import 'package:microblog/features/signup/data/signup_response.dart';
import 'package:microblog/features/signup/exceptions/signup_execute_exception.dart';

abstract class ISignupRepository {
  Future<Either<SignupExecuteException, SignupResponse>> signupExecute({
    required SignupRequest request,
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
      int response = await database.instance.rawInsert(
        'INSERT INTO users(user, email, password) VALUES(?, ?, ?)',
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
}
