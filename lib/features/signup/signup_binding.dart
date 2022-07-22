import 'package:get/get.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/signup/signup_controller.dart';
import 'package:microblog/features/signup/signup_execute_use_case.dart';
import 'package:microblog/features/signup/signup_repository.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(
        router: RouterImpl(),
        signupExecuteUseCase: SignupExecuteUseCase(
          repository: SignupRepository(
            database: MicroblogDatabase(),
          ),
        ),
      ),
    );
  }
}
