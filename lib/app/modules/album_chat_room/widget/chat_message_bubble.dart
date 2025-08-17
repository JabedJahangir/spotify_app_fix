import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'custom_chat_box_container.dart';

class ChatMessageBubble extends StatelessWidget {
  final Map<String, dynamic> message;
  final bool isSender;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    final time = message['timestamp'] != null
        ? DateFormat('h:mma').format(message['timestamp'].toDate())
        : '';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Align(
        alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isSender)
              Padding(
                padding: const EdgeInsets.only(),
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    message['senderProfilePic'] ??
                        'https://via.placeholder.com/150',
                  ),
                ),
              ),
            const SizedBox(width: 6),
            Column(
              crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                CustomChatBoxContainer(
                  isSender: isSender,
                  backGroundColor: isSender ? Colors.blue : Colors.grey[200]!,
                  textColor: isSender ? Colors.white : Colors.black,
                  messageText: message['text'] ?? '',
                ),
                Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
