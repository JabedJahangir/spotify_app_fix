import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/albums_controller.dart';

class AlbumsView extends GetView<AlbumsController> {
  const AlbumsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlbumsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AlbumsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
