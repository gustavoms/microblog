import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:microblog/core/router/pages.dart';
import 'package:microblog/core/theme/app_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    ),
  );
}
