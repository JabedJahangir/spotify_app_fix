import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/musics_controller.dart';

class MusicsView extends GetView<MusicsController> {
  const MusicsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MusicsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MusicsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
