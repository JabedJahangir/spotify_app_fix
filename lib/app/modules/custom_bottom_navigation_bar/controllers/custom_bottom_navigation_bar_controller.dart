import 'package:get/get.dart';

class CustomBottomNavigationBarController extends GetxController {
  //TODO: Implement CustomBottomNavigationBarController

  var currentIndex = 0.obs;
  var isSelected = true;

  void changeTab(int index){
    currentIndex.value = index;
  }

}
