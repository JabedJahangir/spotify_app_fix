import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_in_input_controller.dart';

class LoginInInputView extends GetView<LoginInInputController> {
  const LoginInInputView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginInInputView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoginInInputView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
