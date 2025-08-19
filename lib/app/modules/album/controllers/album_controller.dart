import 'package:get/get.dart';

class AlbumController extends GetxController {
  RxBool isSelected = false.obs;

  void changeFavourite() {
    isSelected.value = !isSelected.value;
  }
}
