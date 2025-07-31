import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/album_selection_controller.dart';

class AlbumSelectionView extends GetView<AlbumSelectionController> {
  const AlbumSelectionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlbumSelectionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AlbumSelectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
