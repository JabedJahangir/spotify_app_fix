import 'package:get/get.dart';

class ArtistProfileController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  // Add artist info
  var artistName = "".obs;
  var artistImage = "".obs;
  var albumCount = 0.obs;
  var songCount = 0.obs;

  void setArtistInfo({
    required String name,
    required String image,
    required int albums,
    required int songs,
  }) {
    artistName.value = name;
    artistImage.value = image;
    albumCount.value = albums;
    songCount.value = songs;
  }

  void valueSelected(int index) {
    selectedIndex.value = index;
  }
}
