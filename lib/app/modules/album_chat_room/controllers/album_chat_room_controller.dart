import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumChatRoomController extends GetxController {
  var messages = <String>[].obs;
  var messageText = ''.obs;

  final textController = TextEditingController();
  final scrollController = ScrollController();

  void sendMessage() {
    if (textController.text.trim().isNotEmpty) {
      messages.add(textController.text.trim());
      textController.clear(); // <-- clear here

      Future.delayed(Duration(milliseconds: 100), () {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }
}
