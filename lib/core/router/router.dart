import 'package:get/get.dart';
import 'package:microblog/core/router/pages.dart';
import 'package:microblog/features/feed/data/feed_parameters.dart';
import 'package:microblog/features/home/home_parameters.dart';
import 'package:microblog/features/news/data/news_parameters.dart';
import 'package:microblog/features/post/data/post_parameters.dart';

abstract class IRouter {
  Future<TReturnType> startSignupPage<TReturnType>({
    bool off = false,
  });
  Future<TReturnType> startHomePage<TReturnType>({
    bool off = false,
    required HomeParameters parameters,
  });
  Future<TReturnType> startLoginPage<TReturnType>({
    bool off = false,
  });
  Future<TReturnType> startPostPage<TReturnType>({
    bool off = false,
    required PostParameters parameters,
  });
  Future<TReturnType> startFeed<TReturnType>({
    bool off = false,
    FeedParameters? parameters,
  });
  Future<TReturnType> startNews<TReturnType>({
    bool off = false,
    NewsParameters? parameters,
  });
  Future<void> goBack<TReturnType>({
    TReturnType? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  });
}

class RouterImpl implements IRouter {
  @override
  Future<TReturnType> startSignupPage<TReturnType>({
    bool off = false,
  }) async {
    if (off) {
      return await Get.offNamed(Routes.SIGNUP);
    }

    return await Get.toNamed(
      Routes.SIGNUP,
    );
  }

  @override
  Future<void> goBack<TReturnType>({
    TReturnType? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) async {
    Get.back<TReturnType>(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );
  }

  @override
  Future<TReturnType> startHomePage<TReturnType>({
    bool off = false,
    required HomeParameters parameters,
  }) async {
    if (off) {
      return await Get.offNamed(
        Routes.HOME,
        arguments: parameters,
      );
    }

    return await Get.toNamed(
      Routes.HOME,
      arguments: parameters,
    );
  }

  @override
  Future<TReturnType> startLoginPage<TReturnType>({
    bool off = false,
  }) async {
    if (off) {
      return await Get.offNamed(Routes.LOGIN);
    }

    return await Get.toNamed(
      Routes.LOGIN,
    );
  }

  @override
  Future<TReturnType> startFeed<TReturnType>({
    bool off = false,
    FeedParameters? parameters,
  }) async {
    if (off) {
      return await Get.offNamed(
        Routes.FEED,
        id: Routes.KEY_NAVIGATION_HOME,
        arguments: parameters ?? FeedParameters(),
      );
    }

    return await Get.toNamed(
      Routes.FEED,
      id: Routes.KEY_NAVIGATION_HOME,
      arguments: parameters ?? FeedParameters(),
    );
  }

  @override
  Future<TReturnType> startNews<TReturnType>({
    bool off = false,
    NewsParameters? parameters,
  }) async {
    if (off) {
      return await Get.offNamed(
        Routes.NEWS,
        id: Routes.KEY_NAVIGATION_HOME,
        arguments: parameters ?? NewsParameters(),
      );
    }

    return await Get.toNamed(
      Routes.NEWS,
      id: Routes.KEY_NAVIGATION_HOME,
      arguments: parameters ?? NewsParameters(),
    );
  }

  @override
  Future<TReturnType> startPostPage<TReturnType>({
    bool off = false,
    required PostParameters parameters,
  }) async {
    if (off) {
      return await Get.offNamed(
        Routes.POST,
        arguments: parameters,
      );
    }

    return await Get.toNamed(
      Routes.POST,
      arguments: parameters,
    );
  }
}
