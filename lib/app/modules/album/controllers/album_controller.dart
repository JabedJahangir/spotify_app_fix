import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../spotify_service.dart';
import '../../../models/album_model.dart';

class AlbumController extends GetxController {
  final SpotifyService spotifyService = SpotifyService();
  var favouriteAlbums = <Album>[].obs;

  // Hold selection state for each album
  var selectedAlbums = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavourites(); // 🔥 Load saved favourites on init
  }

  bool isAlbumSelected(String albumName, String artistName) {
    // Use a unique key per album
    final key = '$albumName|$artistName';
    return selectedAlbums[key] ?? false;
  }

  void toggleAlbumSelection(String albumName, String artistName, Album album) {
    final key = '$albumName|$artistName';
    final current = selectedAlbums[key] ?? false;

    if (!current) {
      // Add to favourites if not already
      if (!favouriteAlbums.any(
        (a) => a.name == albumName && a.artist == artistName,
      )) {
        favouriteAlbums.add(album);
      }
    } else {
      // Remove from favourites
      favouriteAlbums.removeWhere(
        (a) => a.name == albumName && a.artist == artistName,
      );
    }

    selectedAlbums[key] = !current;

    saveFavourites(); // 🔥 Save changes
  }

  Future<void> saveFavourites() async {
    final prefs = await SharedPreferences.getInstance();

    // Convert albums to JSON list
    final List<String> jsonList =
        favouriteAlbums.map((album) => jsonEncode(album.toJson())).toList();

    await prefs.setStringList('favourite_albums', jsonList);
  }

  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList('favourite_albums');

    if (jsonList != null) {
      favouriteAlbums.value = jsonList
          .map((albumStr) => Album.fromJson(jsonDecode(albumStr)))
          .toList();

      // Restore selectedAlbums state
      for (var album in favouriteAlbums) {
        final key = '${album.name}|${album.artist}';
        selectedAlbums[key] = true;
      }
    }
  }
}
