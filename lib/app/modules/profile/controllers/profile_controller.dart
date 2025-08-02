import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  final RxInt selectedIndex = 0.obs;

  void valueSelected(int index) {
    selectedIndex.value = index;
  }

}
