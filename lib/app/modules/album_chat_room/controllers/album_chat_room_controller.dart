import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumChatRoomController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();

  // Current logged-in user from Firebase Auth
  late String currentUserId;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Cache user profiles to avoid multiple reads
  final Map<String, Map<String, dynamic>> userCache = {};

  @override
  void onInit() {
    super.onInit();
    final user = auth.currentUser;
    if (user != null) {
      currentUserId = user.uid;
    } else {
      currentUserId = '';
    }
  }

  Stream<QuerySnapshot> get messagesStream => firestore
      .collection('chat_rooms')
      .doc('room1')
      .collection('messages')
      .orderBy('timestamp')
      .snapshots();

  void sendMessage() {
    if (textController.text.trim().isNotEmpty && currentUserId.isNotEmpty) {
      firestore
          .collection('chat_rooms')
          .doc('room1')
          .collection('messages')
          .add({
        "senderId": currentUserId,
        "text": textController.text.trim(),
        "timestamp": FieldValue.serverTimestamp(),
      });
      textController.clear();

      // Scroll to bottom smoothly after sending
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 60,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    }
  }

  // Fetch user profile from Firestore and cache it
  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    if (userCache.containsKey(userId)) {
      return userCache[userId]!;
    } else {
      final doc = await firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        userCache[userId] = data;
        return data;
      } else {
        return {"profilePic": ""};
      }
    }
  }
}
