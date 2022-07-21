import 'package:dartz/dartz.dart';
import 'package:microblog/features/login/data/login_entity.dart';
import 'package:microblog/features/login/data/login_request.dart';
import 'package:microblog/features/login/data/login_response.dart';
import 'package:microblog/features/login/exceptions/login_execute_exception.dart';
import 'package:microblog/features/login/login_repository.dart';
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
    return await repository.signupExecute(
      request: SignupRequest(
        user: data.user,
        email: data.email,
        password: data.password,
      ),
    );
  }
}
