import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

class LoginInInputController extends GetxController {

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
    // Sign in with email & password
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    User? user = userCredential.user;

    if (user != null) {
      // Fetch user data from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        String username = userDoc['username'] ?? '';
        String firstName = userDoc['firstName'] ?? '';
        String lastName = userDoc['lastName'] ?? '';

        // Navigate and pass username (or full name) as argument
        Get.offAllNamed(
          Routes.CUSTOM_BOTTOM_NAVIGATION_BAR,
          arguments: {
            "username": username,
            "firstName": firstName,
            "lastName": lastName,
          },
        );

        Get.snackbar(
          "Login Successful",
          "Welcome back, $firstName!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.greenAccent,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'User data not found',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
      }
    }
  } on FirebaseException catch (e) {
    Get.snackbar(
      'Sign In Failed',
      e.message ?? "Unknown error occurred",
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
