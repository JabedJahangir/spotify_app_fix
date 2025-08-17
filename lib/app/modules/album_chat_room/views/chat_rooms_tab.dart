// chat_rooms_tab.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controllers/album_chat_room_controller.dart';
import '../widget/chat_message_bubble.dart';
import '../widget/message_input_field.dart';

class ChatRoomsTab extends GetView<AlbumChatRoomController> {
  const ChatRoomsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AlbumChatRoomController());

    return Column(
      children: [
        // Message List
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: controller.messagesStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final messages = snapshot.data!.docs;

              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (controller.scrollController.hasClients) {
                  controller.scrollController.jumpTo(
                    controller.scrollController.position.maxScrollExtent,
                  );
                }
              });

              return ListView.builder(
                controller: controller.scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index].data() as Map<String, dynamic>;
                  return ChatMessageBubble(
                    message: msg,
                    isSender: msg['senderId'] == controller.currentUserId,
                  );
                },
              );
            },
          ),
        ),

        // Input Field
        MessageInputField(controller: controller),
      ],
    );
  }
}
