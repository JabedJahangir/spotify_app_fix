import 'package:get/get.dart';

class LoginInInputController extends GetxController {
  //TODO: Implement LoginInInputController

  var isChecked  = false.obs;

  void checked(){
    isChecked.value = !isChecked.value;
  }

}
