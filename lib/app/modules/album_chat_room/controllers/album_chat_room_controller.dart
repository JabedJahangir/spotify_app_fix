import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumChatRoomController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();

  // Current logged-in user from Firebase Auth
  late String currentUserId;
  late String currentUserName;
  late String currentUserProfilePic;

  // Current album ID for this chat room
  late String currentAlbumId;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Cache user profiles to avoid multiple reads
  final Map<String, Map<String, dynamic>> userCache = {};

  @override
  void onInit() {
    super.onInit();
    _initializeUser();

    final args = Get.arguments;
    currentAlbumId = args?["albumId"] ?? '';

    storeAlbumInfo();
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
        DocumentSnapshot userDoc = await firestore.collection("users").doc(user.uid).get();
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

  Future<void> storeAlbumInfo() async {
    if (currentAlbumId.isEmpty) return;
    try {
      final args = Get.arguments;
      final albumName = args?["albumName"] ?? '';
      final artistName = args?["artistName"] ?? '';
      final imageUrl = args?["image"] ?? '';
      final artistId = args?["artistId"] ?? '';

      final albumDoc = await firestore.collection('album_chat_rooms').doc(currentAlbumId).get();
      if (!albumDoc.exists || !albumDoc.data()!.containsKey('albumName')) {
        await firestore.collection('album_chat_rooms').doc(currentAlbumId).set({
          'albumName': albumName,
          'artistName': artistName,
          'imageUrl': imageUrl,
          'artistId': artistId,
          'createdAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
        print('✅ Album info stored for $albumName');
      }
    } catch (e) {
      print('❌ Error storing album info: $e');
    }
  }

  Stream<QuerySnapshot> get messagesStream => firestore
      .collection('album_chat_rooms')
      .doc(currentAlbumId)
      .collection('messages')
      .orderBy('timestamp')
      .snapshots();

  void sendMessage() async {
    if (textController.text.trim().isNotEmpty && currentUserId.isNotEmpty && currentAlbumId.isNotEmpty) {
      try {
        await firestore.collection('album_chat_rooms').doc(currentAlbumId).collection('messages').add({
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
        Get.snackbar('Error', 'Failed to send message: $e', snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    if (userCache.containsKey(userId)) return userCache[userId]!;
    try {
      final doc = await firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        userCache[userId] = data;
        return data;
      } else {
        return _getFallbackData();
      }
    } catch (e) {
      return _getFallbackData();
    }
  }

  Map<String, dynamic> _getFallbackData() {
    final fallbackData = {
      "username": "Unknown User",
      "firstName": "",
      "lastName": "",
      "profileImage": ""
    };
    return fallbackData;
  }

  void clearUserCache() => userCache.clear();

  Future<String> getUserName(String userId) async {
    if (userId == currentUserId) return currentUserName;
    final profile = await getUserProfile(userId);
    return profile['username'] ?? profile['firstName'] ?? 'Unknown User';
  }

  Future<String> getUserProfilePic(String userId) async {
    if (userId == currentUserId) return currentUserProfilePic;
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