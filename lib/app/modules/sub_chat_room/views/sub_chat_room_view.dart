import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sub_chat_room_controller.dart';

class SubChatRoomView extends GetView<SubChatRoomController> {
  const SubChatRoomView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SubChatRoomView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SubChatRoomView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
