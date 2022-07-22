import 'package:get/get.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/login/login_controller.dart';
import 'package:microblog/features/login/login_execute_use_case.dart';
import 'package:microblog/features/login/login_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        router: RouterImpl(),
        loginExecuteUseCase: LoginExecuteUseCase(
          repository: LoginRepository(
            database: MicroblogDatabase(),
          ),
        ),
      ),
    );
  }
}
