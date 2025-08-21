import 'package:get/get.dart';
import '../../../models/album_model.dart';

class AlbumController extends GetxController {
  var favouriteAlbums = <Album>[].obs;

  // Hold selection state for each album
  var selectedAlbums = <String, bool>{}.obs;

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
  }
}
