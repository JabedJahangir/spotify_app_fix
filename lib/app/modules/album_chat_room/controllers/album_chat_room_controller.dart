import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:tanit_tanit_app/spotify_service.dart';

class AlbumChatRoomController extends GetxController {
  var currentTrackName = ''.obs;
  var currentAlbumName = ''.obs;
  var currentArtistName = ''.obs;
  var currentImageUrl = ''.obs;
  var currentTrackDuration = '0:00'.obs;
  var currentTrackProgress = 0.0.obs;
    // Add these for player control
  var isPlaying = false.obs;
  var currentTrackIndex = 0.obs;
  var tracksList = <Map<String, String>>[].obs;
  var currentAlbumImage = ''.obs;
  var totalTrackDuration = '0:00'.obs;
  var currentPosition = 0.0.obs;
  var totalDuration = 0.0.obs;
  final SpotifyService spotifyService = SpotifyService();
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();

  // Current logged-in user from Firebase Auth (SAME AS LOGIN/SIGNUP)
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

    // Get the albumId from the arguments
    final args = Get.arguments;
    currentAlbumId = args?["albumId"] ?? '';

    // Store album info when user enters the chat room
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
        DocumentSnapshot userDoc =
        await firestore.collection("users").doc(user.uid).get();

        if (userDoc.exists) {
          final userData = userDoc.data() as Map<String, dynamic>;
          currentUserName =
              userData['username'] ?? userData['firstName'] ?? 'Unknown User';
          currentUserProfilePic = userData['profileImage'] ?? '';
          userCache[currentUserId] = userData;
        } else {
          currentUserName =
              user.displayName ?? user.email?.split('@')[0] ?? 'Unknown User';
          currentUserProfilePic = user.photoURL ?? '';
        }
      } catch (e) {
        currentUserName =
            user.displayName ?? user.email?.split('@')[0] ?? 'Unknown User';
        currentUserProfilePic = user.photoURL ?? '';
        print('Error fetching user data: $e');
      }
    } else {
      currentUserId = '';
      currentUserName = 'Guest';
      currentUserProfilePic = '';
    }
  }

  // ✅ Store album information in Firebase when user enters the chat room
  Future<void> storeAlbumInfo() async {
    if (currentAlbumId.isEmpty) return;

    try {
      final args = Get.arguments;
      final albumName = args?["albumName"] ?? '';
      final artistName = args?["artistName"] ?? '';
      final imageUrl = args?["image"] ?? '';
      final artistId = args?["artistId"] ?? '';

      final albumDoc = await firestore
          .collection('album_chat_rooms')
          .doc(currentAlbumId)
          .get();

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

  // Dynamic messages stream
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
    return profile['username'] ?? profile['firstName'] ?? 'Unknown User';
  }

  Future<String> getUserProfilePic(String userId) async {
    if (userId == currentUserId) {
      return currentUserProfilePic;
    }
    final profile = await getUserProfile(userId);
    return profile['profileImage'] ?? '';
  }
   Future<void> playTrack(int index) async {
    if (index < 0 || index >= tracksList.length) return;
    
    try {
      final track = tracksList[index];
      currentTrackIndex.value = index;
      currentTrackName.value = track['name'] ?? '';
      currentAlbumName.value = track['albumName'] ?? '';
      currentArtistName.value = track['artistName'] ?? '';
      currentImageUrl.value = track['image_url']?.isNotEmpty == true 
          ? track['image_url']! 
          : currentAlbumImage.value;
      
      // Parse duration from milliseconds
      final durationMs = int.tryParse(track['duration'] ?? '0') ?? 0;
      totalDuration.value = durationMs / 1000.0; // Convert to seconds
      totalTrackDuration.value = _formatDuration(totalDuration.value);
      currentPosition.value = 0.0;
      currentTrackDuration.value = '0:00';
      currentTrackProgress.value = 0.0;
      
      await SpotifyService.connectToSpotifyRemote();
      await SpotifySdk.play(spotifyUri: 'spotify:track:${track['id']}');
      isPlaying.value = true;

      // Start tracking progress (simplified - you might want to use Spotify SDK events)
      _startProgressTimer();
    } catch (e) {
      print('Error playing track: $e');
    }
  }
   String _formatDuration(double seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = (seconds % 60).floor();
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _startProgressTimer() {
    // This is a simplified timer - in real app, use Spotify SDK events
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (!isPlaying.value) {
        timer.cancel();
        return;
      }
      
      if (currentPosition.value < totalDuration.value) {
        currentPosition.value += 1;
        currentTrackDuration.value = _formatDuration(currentPosition.value);
        currentTrackProgress.value = currentPosition.value / totalDuration.value;
      } else {
        timer.cancel();
      }
    });
  }
    Future<void> seekToPosition(double positionPercentage) async {
    try {
      final positionMs = (totalDuration.value * positionPercentage * 1000).toInt();
      await SpotifySdk.seekTo(positionedMilliseconds: positionMs);
      
      // Update UI immediately
      currentPosition.value = totalDuration.value * positionPercentage;
      currentTrackDuration.value = _formatDuration(currentPosition.value);
      currentTrackProgress.value = positionPercentage;
    } catch (e) {
      print('Error seeking: $e');
    }
  }

  Future<void> pauseTrack() async {
    try {
      await SpotifySdk.pause();
      isPlaying.value = false;
    } catch (e) {
      print('Error pausing track: $e');
    }
  }

  Future<void> resumeTrack() async {
    try {
      await SpotifySdk.resume();
      isPlaying.value = true;
    } catch (e) {
      print('Error resuming track: $e');
    }
  }

  Future<void> playNextTrack() async {
    if (currentTrackIndex.value < tracksList.length - 1) {
      await playTrack(currentTrackIndex.value + 1);
    }
  }

  Future<void> playPreviousTrack() async {
    if (currentTrackIndex.value > 0) {
      await playTrack(currentTrackIndex.value - 1);
    }
  }

  // Call this when loading album tracks
  void setTracksList(List<Map<String, String>> tracks, String albumImage) {
    tracksList.value = tracks;
    currentAlbumImage.value = albumImage;
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
