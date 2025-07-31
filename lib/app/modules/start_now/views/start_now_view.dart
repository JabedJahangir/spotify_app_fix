import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/start_now_controller.dart';

class StartNowView extends GetView<StartNowController> {
  const StartNowView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StartNowView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StartNowView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
