import 'package:get/get.dart';
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

  @override
  void onInit() {
    super.onInit();
    fetchTrendingAlbums();
    fetchPartyTracks(); // <-- fetch party tracks
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
}
