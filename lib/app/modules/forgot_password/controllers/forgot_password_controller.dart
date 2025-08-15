import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  var loading = false.obs;

  Future<void> resetPassword() async {
    if(!formKey.currentState!.validate()) return;
    try {
      loading.value = true;
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      Get.snackbar(
        'Success',
        "Password reset email sent! Please check your inbox.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.toNamed(Routes.VERIFY_EMAIL_ADDRESS);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally{
      loading.value = false;
    }
  }
  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
