import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tanit_tanit_app/spotify_service.dart';

class HomeController extends GetxController {
  final SpotifyService spotifyService = SpotifyService();

  var showAll = false.obs;
  var showLess = false.obs;
  var isLoading = true.obs;

  // Trending albums list
  var trendingAlbums = <dynamic>[].obs;

  // Party tracks list
  var partyTracks = <Map<String, String>>[].obs;

  // Google/Firebase user data
  var userName = ''.obs;
  var userPhoto = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTrendingAlbums();
    fetchPartyTracks();
    fetchGoogleUser(); // 👈 load user info when controller starts
  }

  void toggleShowAll() => showAll.value = !showAll.value;
  void toggleShowLess() => showLess.value = !showLess.value;

  // Fetch trending albums from Spotify
  void fetchTrendingAlbums() async {
    try {
      isLoading.value = true;
      final data = await spotifyService.getTrendingAlbums();
      trendingAlbums.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch party tracks from Spotify
  void fetchPartyTracks() async {
    try {
      isLoading.value = true;
      final tracks = await spotifyService.searchTracks("Parties", limit: 50);
      partyTracks.assignAll(tracks);
    } finally {
      isLoading.value = false;
    }
  }

  // 👇 Get Google signed-in user from Firebase
  void fetchGoogleUser() async {
  final user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    // If the user logged in with Google, use displayName
    if (user.displayName != null && user.displayName!.isNotEmpty) {
      userName.value = user.displayName!;
      userPhoto.value = user.photoURL ?? "";
    } else {
      // Otherwise, fetch user info from Firestore (email/password login)
      try {
        final doc = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();

        if (doc.exists) {
          userName.value = doc['username'] ?? "${user.email?.split('@')[0]}";
          userPhoto.value = doc['profileImage'] ?? "";
        } else {
          // fallback if document doesn't exist
          userName.value = "${user.email?.split('@')[0]}";
          userPhoto.value = "";
        }
      } catch (e) {
        userName.value = "${user.email?.split('@')[0]}";
        userPhoto.value = "";
      }
    }
  } else {
    userName.value = "Guest";
    userPhoto.value = "";
  }
}
}
