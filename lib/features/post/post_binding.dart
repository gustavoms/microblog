import 'package:get/get.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/post/post_controller.dart';
import 'package:microblog/features/post/post_create_use_case.dart';
import 'package:microblog/features/post/post_delete_use_case.dart';
import 'package:microblog/features/post/post_repository.dart';
import 'package:microblog/features/post/post_update_use_case.dart';

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
        postUpdateUseCase: PostUpdateUseCase(
          repository: PostRepository(
            database: MicroblogDatabase(),
          ),
        ),
        postDeleteUseCase: PostDeleteUseCase(
          repository: PostRepository(
            database: MicroblogDatabase(),
          ),
        ),
      ),
    );
  }
}
