import 'package:get/get.dart';

class MyChatRoomController extends GetxController {

  final RxInt selectedIndex = 0.obs;

  void valueSelected(int index) {
    selectedIndex.value = index;
  }
}
