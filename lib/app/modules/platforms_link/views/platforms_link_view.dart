import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/platforms_link_controller.dart';

class PlatformsLinkView extends GetView<PlatformsLinkController> {
  const PlatformsLinkView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlatformsLinkView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PlatformsLinkView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
