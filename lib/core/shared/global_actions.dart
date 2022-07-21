import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackbarError({
  required String message,
}) {
  return Get.snackbar(
    'error'.tr,
    message,
    icon: const Icon(
      Icons.error_outline_rounded,
      color: Colors.red,
    ),
    isDismissible: true,
    snackPosition: SnackPosition.BOTTOM,
  );
}
