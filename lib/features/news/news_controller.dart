import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/features/news/data/news_parameters.dart';

class NewsController extends BaseController<NewsParameters> {
  NewsController({
    required IRouter router,
  }) : super(router: router);
}
