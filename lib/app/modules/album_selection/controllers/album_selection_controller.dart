import 'package:get/get.dart';

class AlbumSelectionController extends GetxController {
  var selectedAlbums = <String>[].obs;

  void toggleSelection(String albumId) {
    if (selectedAlbums.contains(albumId)) {
      selectedAlbums.remove(albumId); // deselect
    } else {
      if (selectedAlbums.length < 3) {
        selectedAlbums.add(albumId); // select if under limit
      }
    }
  }
  bool isSelected(String albumId) => selectedAlbums.contains(albumId);
}
