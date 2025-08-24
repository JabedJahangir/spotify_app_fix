import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/spotify_service.dart';

class AlbumChatRoomController extends GetxController {
  final SpotifyService spotifyService = SpotifyService();
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();

  late String currentUserId;
  late String currentUserName;
  late String currentUserProfilePic;

  late String currentAlbumId;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final Map<String, Map<String, dynamic>> userCache = {};

  @override
  void onInit() {
    super.onInit();
    _initializeUser();

    final args = Get.arguments;
    currentAlbumId = args?["albumId"] ?? '';
  }

  @override
  void onClose() {
    scrollController.dispose();
    textController.dispose();
    super.onClose();
  }

  void _initializeUser() async {
    final user = auth.currentUser;
    if (user != null) {
      currentUserId = user.uid;

      try {
        DocumentSnapshot userDoc = await firestore
            .collection("users")
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          final userData = userDoc.data() as Map<String, dynamic>;
          currentUserName = userData['username'] ?? userData['firstName'] ?? 'Unknown User';
          currentUserProfilePic = userData['profileImage'] ?? '';

          userCache[currentUserId] = userData;
        } else {
          currentUserName = user.displayName ?? user.email?.split('@')[0] ?? 'Unknown User';
          currentUserProfilePic = user.photoURL ?? '';
        }
      } catch (e) {
        currentUserName = user.displayName ?? user.email?.split('@')[0] ?? 'Unknown User';
        currentUserProfilePic = user.photoURL ?? '';
        print('Error fetching user data: $e');
      }
    } else {
      currentUserId = '';
      currentUserName = 'Guest';
      currentUserProfilePic = '';
    }
  }

  Stream<QuerySnapshot> get messagesStream => firestore
      .collection('album_chat_rooms')
      .doc(currentAlbumId)
      .collection('messages')
      .orderBy('timestamp')
      .snapshots();

  void sendMessage() async {
    if (textController.text.trim().isNotEmpty &&
        currentUserId.isNotEmpty &&
        currentAlbumId.isNotEmpty) {

      try {
        await firestore
            .collection('album_chat_rooms')
            .doc(currentAlbumId)
            .collection('messages')
            .add({
          "senderId": currentUserId,
          "senderName": currentUserName,
          "senderProfilePic": currentUserProfilePic,
          "text": textController.text.trim(),
          "timestamp": FieldValue.serverTimestamp(),
        });

        textController.clear();

        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent + 60,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to send message: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    if (userCache.containsKey(userId)) {
      return userCache[userId]!;
    } else {
      try {
        final doc = await firestore.collection('users').doc(userId).get();
        if (doc.exists) {
          final data = doc.data() as Map<String, dynamic>;
          userCache[userId] = data;
          return data;
        } else {
          final fallbackData = {
            "username": "Unknown User",
            "firstName": "",
            "lastName": "",
            "profileImage": ""
          };
          userCache[userId] = fallbackData;
          return fallbackData;
        }
      } catch (e) {
        final fallbackData = {
          "username": "Unknown User",
          "firstName": "",
          "lastName": "",
          "profileImage": ""
        };
        userCache[userId] = fallbackData;
        return fallbackData;
      }
    }
  }

  void clearUserCache() {
    userCache.clear();
  }

  Future<String> getUserName(String userId) async {
    if (userId == currentUserId) {
      return currentUserName;
    }

    final profile = await getUserProfile(userId);
    return profile['username'] ??
        profile['firstName'] ??
        'Unknown User';
  }

  Future<String> getUserProfilePic(String userId) async {
    if (userId == currentUserId) {
      return currentUserProfilePic;
    }

    final profile = await getUserProfile(userId);
    return profile['profileImage'] ?? '';
  }

  void debugUserInfo() {
    print('=== DEBUG USER INFO ===');
    print('Current User ID: $currentUserId');
    print('Current User Name: $currentUserName');
    print('Current User Profile Pic: $currentUserProfilePic');
    print('Current Album ID: $currentAlbumId');
    print('Firebase Auth User: ${auth.currentUser?.uid}');
    print('======================');
  }
}