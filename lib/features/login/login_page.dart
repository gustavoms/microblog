import 'package:flutter/material.dart';
import 'package:microblog/core/abstractions/base_page.dart';
import 'package:microblog/features/login/login_controller.dart';

class LoginPage extends BasePage<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
