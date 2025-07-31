import 'package:get/get.dart';

import '../controllers/album_selection_controller.dart';

class AlbumSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlbumSelectionController>(
      () => AlbumSelectionController(),
    );
  }
}
