import 'package:flutter/material.dart';

class CustomChatBoxContainer extends StatelessWidget {
  final bool isSender;
  final Color backGroundColor;
  final Color? textColor;
  final String messageText;

  const CustomChatBoxContainer({
    super.key,
    required this.isSender,
    required this.backGroundColor,
    this.textColor,
    required this.messageText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isSender ? 12 : 0),
          topRight: Radius.circular(isSender ? 0 : 12),
          bottomLeft: const Radius.circular(12),
          bottomRight: const Radius.circular(12),
        ),
      ),
      child: Text(
        messageText,
        style: TextStyle(color: textColor ?? Colors.black),
      ),
    );
  }
}

