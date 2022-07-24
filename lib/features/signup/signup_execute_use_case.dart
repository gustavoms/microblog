import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:microblog/features/signup/data/signup_entity.dart';
import 'package:microblog/features/signup/data/signup_request.dart';
import 'package:microblog/features/signup/data/signup_response.dart';
import 'package:microblog/features/signup/exceptions/signup_execute_exception.dart';
import 'package:microblog/features/signup/signup_repository.dart';

class SignupExecuteUseCase {
  final ISignupRepository repository;

  SignupExecuteUseCase({
    required this.repository,
  });

  Future<Either<SignupExecuteException, SignupResponse>> call({
    required SignupEntity data,
  }) async {
    final emailExists = await repository.emailExists(email: data.email);

    if (emailExists.getOrElse(() => false)) {
      return Left(
        SignupExecuteException(
          cause: 'email_already_exists'.tr,
        ),
      );
    }

    final userExists = await repository.userExists(user: data.user);

    if (userExists.getOrElse(() => false)) {
      return Left(
        SignupExecuteException(
          cause: 'user_already_exists'.tr,
        ),
      );
    }

    return await repository.signupExecute(
      request: SignupRequest(
        user: data.user,
        email: data.email,
        password: data.password,
      ),
    );
  }
}
