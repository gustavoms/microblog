import 'package:flutter/material.dart';
import 'package:microblog/core/abstractions/base_page.dart';
import 'package:microblog/features/home/home_controller.dart';

class HomePage extends BasePage<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Text("Initial Home Page"),
    );
  }
}
