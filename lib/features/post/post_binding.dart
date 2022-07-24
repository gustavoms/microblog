import 'package:get/get.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/post/post_controller.dart';
import 'package:microblog/features/post/post_create_use_case.dart';
import 'package:microblog/features/post/post_repository.dart';

class PostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostController>(
      () => PostController(
        router: RouterImpl(),
        storage: Storage(),
        postCreateUseCase: PostCreateUseCase(
          repository: PostRepository(
            database: MicroblogDatabase(),
          ),
        ),
      ),
    );
  }
}
