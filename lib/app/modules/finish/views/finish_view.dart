import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/finish_controller.dart';

class FinishView extends GetView<FinishController> {
  const FinishView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FinishView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FinishView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
