import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

class LoginInInputController extends GetxController {
  //TODO: Implement LoginInInputController

  var isChecked = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  var loading = false.obs;

  void checked() {
    isChecked.value = !isChecked.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signIn() async {
    if (!formKey.currentState!.validate()) return;
    loading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAllNamed(Routes.CUSTOM_BOTTOM_NAVIGATION_BAR);
      Get.snackbar(
        "Login Successful",
        "Welcome back!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.greenAccent,
        colorText: Colors.white,
      );    } on FirebaseException catch (e) {
      Get.snackbar(
        'Sign In Failed',
        e.message ?? "Unknown error occured",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    } finally {
      loading.value = false;
    }
  }
}
