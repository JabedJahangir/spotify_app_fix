import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_sign_up_controller.dart';

class UserSignUpView extends GetView<UserSignUpController> {
  const UserSignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserSignUpView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UserSignUpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
