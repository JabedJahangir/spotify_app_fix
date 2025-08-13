import 'package:get/get.dart';

class HomeController extends GetxController {
  var showAll = false.obs;

  void toggleShowAll (){
   showAll.value = !showAll.value;
  }
}
