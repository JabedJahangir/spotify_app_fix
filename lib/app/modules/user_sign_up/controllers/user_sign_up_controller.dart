import 'package:get/get.dart';

class UserSignUpController extends GetxController {
  //TODO: Implement UserSignUpController

  var isChecked = false.obs;

  void checked(){
    isChecked.value = !isChecked.value;
  }
}
