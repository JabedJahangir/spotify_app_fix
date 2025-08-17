import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../spotify_service.dart';

class AlbumChatRoomController extends GetxController {
  final SpotifyService spotifyService = SpotifyService();
  var messages = <String>[].obs;
  var messageText = ''.obs;

  final textController = TextEditingController();
  final scrollController = ScrollController();

  // Audio player for track previews
  final AudioPlayer audioPlayer = AudioPlayer();

  void sendMessage() {
    if (textController.text.trim().isNotEmpty) {
      messages.add(textController.text.trim());
      textController.clear();

      Future.delayed(const Duration(milliseconds: 100), () {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  /// Play a Spotify preview URL
  void playPreview(String url) async {
    try {
      await audioPlayer.setUrl(url);
      audioPlayer.play();
    } catch (e) {
      print("❌ Error playing track: $e");
    }
  }

  /// Stop any currently playing preview
  void stopPreview() {
    audioPlayer.stop();
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    textController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}

