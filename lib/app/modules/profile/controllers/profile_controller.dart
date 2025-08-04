import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isPlayInBackground = true.obs;

  void togglePlayInBackground() {
    isPlayInBackground.value = !isPlayInBackground.value;
  }
}
