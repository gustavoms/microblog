import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BasePage<TController> extends GetView<TController> {
  const BasePage({Key? key}) : super(key: key);
}
