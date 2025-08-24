import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../spotify_service.dart';

class CustomSearchController extends GetxController {
  RxList<String> recentSearches = <String>[].obs;
  RxBool isLoading = true.obs; // <-- track loading

  // Search results
  RxList<Map<String, String>> artists = <Map<String, String>>[].obs;
  RxList<Map<String, String>> albums = <Map<String, String>>[].obs;
  RxList<String> genres = <String>[].obs;

  final SpotifyService spotifyService = SpotifyService();
  static const String _recentKey = 'recent_searches';

  @override
  void onInit() {
    super.onInit();
    _loadRecentSearches();
  }

  Future<void> _loadRecentSearches() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedSearches = prefs.getStringList(_recentKey) ?? [];
      print(
        "Loading recent searches from SharedPreferences: $storedSearches",
      ); // 🔹 debug
      recentSearches.value = storedSearches;
    } catch (e) {
      print("Error loading recent searches: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _saveRecentSearches() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_recentKey, recentSearches);
      print(
        "Saved recent searches to SharedPreferences: ${recentSearches.toList()}",
      ); // 🔹 debug
    } catch (e) {
      print("Error saving recent searches: $e");
    }
  }

  Future<void> addSearch(String query) async {
    if (query.isEmpty) return;

    recentSearches.remove(query); // remove duplicate
    recentSearches.insert(0, query); // add to top

    if (recentSearches.length > 10) recentSearches.removeLast();

    print("Adding search query: $query"); // 🔹 debug
    print(
      "Current recent searches list: ${recentSearches.toList()}",
    ); // 🔹 debug

    await _saveRecentSearches();
  }

  Future<void> search(String query) async {
    await addSearch(query);

    final trackResults = await spotifyService.searchTracks(query);

    // Extract unique artists
    final artistMap = <String, Map<String, String>>{};
    for (var track in trackResults) {
      for (var artistName in track['artist']!.split(', ')) {
        artistMap[artistName] ??= {
          'name': artistName,
          'image_url': track['image_url'] ?? '',
        };
      }
    }
    artists.value = artistMap.values.toList();

    // Extract unique albums
    final albumMap = <String, Map<String, String>>{};
    for (var track in trackResults) {
      final albumName = track['name'] ?? '';
      albumMap[albumName] ??= {
        'name': albumName,
        'image_url': track['image_url'] ?? '',
      };
    }
    albums.value = albumMap.values.toList();

    // Genres
    genres.value = artists.map((e) => e['name']!).toList();
  }

  Future<void> clearRecentSearches() async {
    recentSearches.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_recentKey);
  }
}
