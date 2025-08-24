import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/spotify_service.dart';

class MyChatRoomController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final SpotifyService spotifyService = SpotifyService();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Observable lists for user's chat rooms
  var userChatRooms = <Map<String, dynamic>>[].obs;
  var userSubRooms = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  // Current user ID
  late String currentUserId;

  @override
  void onInit() {
    super.onInit();
    _initializeUser();
    fetchUserChatRooms();
  }

  void _initializeUser() {
    final user = auth.currentUser;
    if (user != null) {
      currentUserId = user.uid;
    } else {
      currentUserId = '';
    }
  }

  void valueSelected(int index) {
    selectedIndex.value = index;
  }

  // Fetch chat rooms where current user has sent messages
  void fetchUserChatRooms() async {
    if (currentUserId.isEmpty) return;

    try {
      isLoading.value = true;

      // Get all album chat rooms collection
      final albumChatRoomsSnapshot = await firestore
          .collection('album_chat_rooms')
          .get();

      List<Map<String, dynamic>> chatRoomsList = [];
      List<Map<String, dynamic>> subRoomsList = [];

      // Check each album chat room for user's messages
      for (var albumDoc in albumChatRoomsSnapshot.docs) {
        final albumId = albumDoc.id;

        // Check if user has sent any messages in this album's chat room
        final messagesSnapshot = await firestore
            .collection('album_chat_rooms')
            .doc(albumId)
            .collection('messages')
            .where('senderId', isEqualTo: currentUserId)
            .limit(1)
            .get();

        if (messagesSnapshot.docs.isNotEmpty) {
          // User has sent messages in this album
          // Get the latest message for preview
          final latestMessageSnapshot = await firestore
              .collection('album_chat_rooms')
              .doc(albumId)
              .collection('messages')
              .orderBy('timestamp', descending: true)
              .limit(1)
              .get();

          String latestMessage = '';
          String senderName = '';
          if (latestMessageSnapshot.docs.isNotEmpty) {
            final latestMsg = latestMessageSnapshot.docs.first.data();
            latestMessage = latestMsg['text'] ?? '';
            senderName = latestMsg['senderName'] ?? 'Unknown';
          }

          // Check if album info exists in the document
          final albumDocData = albumDoc.data() as Map<String, dynamic>?;

          if (albumDocData != null &&
              albumDocData.containsKey('albumName') &&
              albumDocData['albumName'] != null) {
            // Album info already stored in Firebase
            final albumData = {
              'albumId': albumId,
              'albumName': albumDocData['albumName'] ?? 'Unknown Album',
              'artistName': albumDocData['artistName'] ?? 'Unknown Artist',
              'imageUrl': albumDocData['imageUrl'] ?? '',
              'latestMessage': latestMessage,
              'latestSenderName': senderName,
              'artistId': albumDocData['artistId'] ?? '',
            };

            chatRoomsList.add(albumData);
          } else {
            // Album info not stored, add with basic info
            final albumData = {
              'albumId': albumId,
              'albumName': 'Unknown Album',
              'artistName': 'Unknown Artist',
              'imageUrl': '',
              'latestMessage': latestMessage,
              'latestSenderName': senderName,
              'artistId': '',
            };

            chatRoomsList.add(albumData);
          }
        }

        // Check subrooms (if any exist)
        final subRoomsSnapshot = await firestore
            .collection('album_chat_rooms')
            .doc(albumId)
            .collection('sub_rooms')
            .get();

        for (var subRoomDoc in subRoomsSnapshot.docs) {
          final subRoomId = subRoomDoc.id;

          // Check if user has messages in this subroom
          final subMessagesSnapshot = await firestore
              .collection('album_chat_rooms')
              .doc(albumId)
              .collection('sub_rooms')
              .doc(subRoomId)
              .collection('messages')
              .where('senderId', isEqualTo: currentUserId)
              .limit(1)
              .get();

          if (subMessagesSnapshot.docs.isNotEmpty) {
            // Get latest message from subroom
            final latestSubMessageSnapshot = await firestore
                .collection('album_chat_rooms')
                .doc(albumId)
                .collection('sub_rooms')
                .doc(subRoomId)
                .collection('messages')
                .orderBy('timestamp', descending: true)
                .limit(1)
                .get();

            String latestSubMessage = '';
            String subSenderName = '';
            if (latestSubMessageSnapshot.docs.isNotEmpty) {
              final latestMsg = latestSubMessageSnapshot.docs.first.data();
              latestSubMessage = latestMsg['text'] ?? '';
              subSenderName = latestMsg['senderName'] ?? 'Unknown';
            }

            // Get subroom data
            final subRoomData = subRoomDoc.data() as Map<String, dynamic>;

            subRoomsList.add({
              'albumId': albumId,
              'subRoomId': subRoomId,
              'subRoomName': subRoomData['name'] ?? 'Subroom',
              'albumName': subRoomData['albumName'] ?? 'Unknown Album',
              'artistName': subRoomData['artistName'] ?? 'Unknown Artist',
              'imageUrl': subRoomData['imageUrl'] ?? '',
              'latestMessage': latestSubMessage,
              'latestSenderName': subSenderName,
            });
          }
        }
      }

      // Update observable lists
      userChatRooms.assignAll(chatRoomsList);
      userSubRooms.assignAll(subRoomsList);

    } catch (e) {
      print('Error fetching user chat rooms: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Refresh data
  void refreshChatRooms() {
    fetchUserChatRooms();
  }
}