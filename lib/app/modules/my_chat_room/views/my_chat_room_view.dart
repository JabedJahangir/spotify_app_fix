import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_chat_room_controller.dart';

class MyChatRoomView extends GetView<MyChatRoomController> {
  const MyChatRoomView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyChatRoomView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyChatRoomView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
