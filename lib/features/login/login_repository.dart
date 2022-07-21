import 'package:dartz/dartz.dart';
import 'package:microblog/features/login/data/login_request.dart';
import 'package:microblog/features/login/data/login_response.dart';
import 'package:microblog/features/login/exceptions/login_execute_exception.dart';

abstract class ILoginRepository {
  Future<Either<LoginExecuteException, LoginResponse>> loginExecute({
    required LoginRequest request,
  });
}

class LoginRepository implements ILoginRepository {
  LoginRepository();

  @override
  Future<Either<LoginExecuteException, LoginResponse>> loginExecute({
    required LoginRequest request,
  }) async {
    return right(
      LoginResponse(
        success: true,
      ),
    );
  }
}
