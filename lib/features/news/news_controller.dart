import 'package:get/get.dart';
import 'package:microblog/core/abstractions/base_controller.dart';
import 'package:microblog/core/router/router.dart';
import 'package:microblog/core/shared/global_actions.dart';
import 'package:microblog/features/news/data/news_entity.dart';
import 'package:microblog/features/news/data/news_parameters.dart';
import 'package:microblog/features/news/data/news_request.dart';
import 'package:microblog/features/news/news_find_all_use_case.dart';

class NewsController extends BaseController<NewsParameters> {
  final _news = <NewsEntity>[].obs;
  set news(value) => _news.value = value;
  RxList<NewsEntity> get news => _news;

  final NewsFindAllUseCase newsFindAllUseCase;

  NewsController({
    required IRouter router,
    required this.newsFindAllUseCase,
  }) : super(router: router);

  @override
  onReady() async {
    await reload();
    super.onReady();
  }

  Future<void> reload() async {
    loading = true;
    (await newsFindAllUseCase(data: NewsRequest())).fold(
      (l) {
        loading = false;
        showSnackbarError(
          message: l.cause,
        );
      },
      (r) {
        loading = false;
        news.clear();
        news.addAll(r);
      },
    );
  }
}
