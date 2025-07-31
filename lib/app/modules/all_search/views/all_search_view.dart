import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_search_controller.dart';

class AllSearchView extends GetView<AllSearchController> {
  const AllSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllSearchView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllSearchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
