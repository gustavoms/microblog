import 'package:get/get.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/feed/feed_controller.dart';
import 'package:microblog/features/post/post_find_all_use_case.dart';
import 'package:microblog/features/post/post_repository.dart';

class FeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedController>(
      () => FeedController(
        router: RouterImpl(),
        postFindAllUseCase: PostFindAllUseCase(
          repository: PostRepository(
            database: MicroblogDatabase(),
          ),
        ),
        storage: Storage(),
      ),
    );
  }
}
