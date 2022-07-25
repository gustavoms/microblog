import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:microblog/core/data/database.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/feed/feed_controller.dart';
import 'package:microblog/features/post/post_find_all_use_case.dart';
import 'package:microblog/features/post/post_repository.dart';

void main() {
  group('feed controller testing cases', () {
    tearDown(() {
      Get.reset();
    });

    test('should be fine user id connected', () async {
      final storage = Storage();
      storage.setUserId(1);

      final controller = FeedController(
        router: RouterImpl(),
        storage: storage,
        postFindAllUseCase: PostFindAllUseCase(
          repository: PostRepository(
            database: MicroblogDatabase(),
          ),
        ),
      );

      await controller.loadCurrentUserId();
      expect(controller.currentUserId, 1);
    });
  });
}
