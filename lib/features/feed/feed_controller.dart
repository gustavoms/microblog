import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/core/shared/global_actions.dart';
import 'package:microblog/features/feed/data/feed_entity.dart';
import 'package:microblog/features/feed/data/feed_parameters.dart';
import 'package:microblog/features/feed/data/feed_request.dart';
import 'package:microblog/features/feed/feed_load_use_case.dart';

class FeedController extends BaseController<FeedParameters> {
  final _feedPosts = <FeedEntity>[].obs;
  set feedPosts(value) => _feedPosts.value = value;
  RxList<FeedEntity> get feedPosts => _feedPosts;

  final FeedLoadUseCase feedLoadUseCase;

  FeedController({
    required IRouter router,
    required this.feedLoadUseCase,
  }) : super(router: router);

  @override
  void onReady() async {
    await reload();
    super.onReady();
  }

  Future<void> reload() async {
    (await feedLoadUseCase(data: FeedRequest())).fold(
      (l) => showSnackbarError(message: l.cause),
      (r) {
        feedPosts.clear();
        feedPosts.addAll(r.posts);
      },
    );
  }
}
