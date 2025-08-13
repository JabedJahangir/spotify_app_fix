import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

class LoginInInputController extends GetxController {
  //TODO: Implement LoginInInputController

  var isChecked  = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  void checked(){
    isChecked.value = !isChecked.value;
  }
  void login() {
    Get.toNamed(Routes.HOME);
  }
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

}
