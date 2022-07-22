import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/feed/data/feed_parameters.dart';

class FeedController extends BaseController<FeedParameters> {
  FeedController({
    required IRouter router,
  }) : super(router: router);
}
