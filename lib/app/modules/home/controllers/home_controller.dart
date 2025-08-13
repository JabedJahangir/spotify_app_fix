import 'package:get/get.dart';

class HomeController extends GetxController {
  var showAll = false.obs;
  var showLess = false.obs;

  void toggleShowAll (){
   showAll.value = !showAll.value;
  }
  void toggleShowLess (){
    showLess.value = !showLess.value;
  }
}
