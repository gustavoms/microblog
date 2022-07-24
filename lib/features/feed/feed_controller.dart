import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/core/data/storage.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/core/shared/global_actions.dart';
import 'package:microblog/features/feed/data/feed_entity.dart';
import 'package:microblog/features/feed/data/feed_parameters.dart';
import 'package:microblog/features/post/data/post_entity.dart';
import 'package:microblog/features/post/data/post_parameters.dart';
import 'package:microblog/features/post/post_find_all_use_case.dart';

class FeedController extends BaseController<FeedParameters> {
  final _feedPosts = <FeedEntity>[].obs;
  set feedPosts(value) => _feedPosts.value = value;
  RxList<FeedEntity> get feedPosts => _feedPosts;

  final PostFindAllUseCase postFindAllUseCase;
  final Storage storage;
  late final int currentUserId;

  FeedController({
    required IRouter router,
    required this.storage,
    required this.postFindAllUseCase,
  }) : super(router: router);

  @override
  void onReady() async {
    currentUserId = await storage.getUserId();
    await reload();
    super.onReady();
  }

  Future<void> editPost({
    required FeedEntity item,
  }) async {
    await router.startPostPage(
      parameters: PostParameters(
        post: PostEntity(
          id: item.id,
          message: item.message,
          userId: item.userId,
          date: item.date,
          user: item.user,
          photo: item.photo,
        ),
      ),
    );
    await reload();
  }

  Future<void> reload() async {
    loading = true;
    (await postFindAllUseCase()).fold(
      (l) {
        loading = false;
        showSnackbarError(message: l.cause);
      },
      (r) {
        loading = false;
        feedPosts.clear();
        feedPosts.addAll(
          r.posts
              .map(
                (e) => FeedEntity(
                  id: e.id,
                  userId: e.userId,
                  user: e.user,
                  date: e.date,
                  message: e.message,
                  photo: e.photo,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
