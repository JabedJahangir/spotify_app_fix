import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

class UserSignUpController extends GetxController {
  var isChecked = false.obs;

  var selectedMonth = Rxn<String>();
  var selectedDay = Rxn<String>();
  var selectedYear = Rxn<String>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final List<String> days = List.generate(
    31,
    (index) => (index + 1).toString(),
  );
  final List<String> years = List.generate(
    76,
    (index) => (2025 - index).toString(),
  );

  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  var loading = false.obs;
  var profileImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();

  void checked() {
    isChecked.value = !isChecked.value;
  }

  void selectMonth(String item) => selectedMonth.value = item;

  void selectDay(String item) => selectedDay.value = item;

  void selectYear(String item) => selectedYear.value = item;

  void setProfileImage(File file) {
    profileImage.value = file;
  }

  void signUp() async {
    if (!formKey.currentState!.validate()) return;
    loading.value = true;
    try {
      // Create user in Firebase Auth
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      User? user = userCredential.user;

      if (user != null) {
        // Save user data in Firestore
        await firestore.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "firstName": firstNameController.text.trim(),
          "lastName": lastNameController.text.trim(),
          "username": userNameController.text.trim(),
          "email": emailController.text.trim(),
          "dob":
              "${selectedDay.value}-${selectedMonth.value}-${selectedYear.value}",
          "createdAt": FieldValue.serverTimestamp(),
          "profileImage": profileImage.value?.path,
        });
      }

      Get.offAllNamed(Routes.FINISH);         
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Sign Up Failed",
        e.message ?? "Unknown error occurred",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    } finally {
      loading.value = false;
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setProfileImage(File(pickedFile.path));
    }
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setProfileImage(File(pickedFile.path));
    }
  }
}
