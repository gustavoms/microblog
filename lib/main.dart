import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:microblog/core/router/pages.dart';
import 'package:microblog/core/theme/app_theme.dart';
import 'package:microblog/core/translations/text_translations.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      translationsKeys: AppTranslation.translationsKeys,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('pt', 'BR'),
    ),
  );
}
