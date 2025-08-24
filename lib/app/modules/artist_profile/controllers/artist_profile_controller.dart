import 'package:get/get.dart';

class ArtistProfileController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  // Add artist info
  var artistName = "".obs;
  var artistImage = "".obs;
  var albumCount = 0.obs;
  var songCount = 0.obs;
  var isLoading = true.obs; // ← add this

  @override
  void onInit() {
    super.onInit();
    // Simulate 2 seconds loading
    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;
    });
  }

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
