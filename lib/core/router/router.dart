import 'package:get/get.dart';
import 'package:microblog/core/router/pages.dart';

abstract class IRouter {
  Future<TReturnType> startSignupPage<TReturnType>({
    bool off = false,
  });
  Future<TReturnType> startHomePage<TReturnType>({
    bool off = false,
  });
  Future<TReturnType> startLoginPage<TReturnType>({
    bool off = false,
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
  Future<TReturnType> startHomePage<TReturnType>({bool off = false}) async {
    if (off) {
      return await Get.offNamed(Routes.HOME);
    }

    return await Get.toNamed(
      Routes.HOME,
    );
  }

  @override
  Future<TReturnType> startLoginPage<TReturnType>({bool off = false}) async {
    if (off) {
      return await Get.offNamed(Routes.LOGIN);
    }

    return await Get.toNamed(
      Routes.LOGIN,
    );
  }
}
