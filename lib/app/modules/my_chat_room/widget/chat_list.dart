import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

class ChatList extends StatelessWidget {
  final String albumName;
  final String artistName;
  final String imageUrl;
  final String latestMessage;
  final String latestSenderName;

  const ChatList({
    super.key,
    required this.albumName,
    required this.artistName,
    required this.imageUrl,
    required this.latestMessage,
    required this.latestSenderName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 1.2,
        color: AppColors.white,
        margin: EdgeInsets.symmetric(vertical: 7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey[300],
                  child: imageUrl.isNotEmpty
                      ? ClipOval(
                    child: Image.network(
                      imageUrl,
                      width: 44,
                      height: 44,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.album, color: Colors.grey, size: 24);
                      },
                    ),
                  )
                      : Icon(Icons.album, color: Colors.grey, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        albumName.isNotEmpty ? albumName : "Unknown Album",
                        style: AppTextStyles.regular16.copyWith(color: AppColors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${latestSenderName.isNotEmpty ? latestSenderName : 'Unknown'}: ${latestMessage.isNotEmpty ? latestMessage : 'No messages'}",
                              style: AppTextStyles.light12.copyWith(color: AppColors.greyTextColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}