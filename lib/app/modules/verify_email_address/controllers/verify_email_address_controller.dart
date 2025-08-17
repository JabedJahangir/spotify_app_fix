import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerifyEmailAddressController extends GetxController {
  final loading = false.obs;
  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var timerText = "00:60".obs;
  Timer? timer;
  int remainingSeconds = 30;

  Future<void> otpVerify() async {
    try {
      loading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      loading.value = false;
    } catch (e) {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    remainingSeconds = 60;
    updateTimerText();

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        updateTimerText();
      } else {
        t.cancel();
      }
    });
  }

  void updateTimerText() {
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
    timerText.value = "$minutes:$seconds";
  }

  void resendCode() {
    startTimer();
  }

  @override
  void onClose() {
    timer?.cancel();
    otpController.dispose();
    super.onClose();
  }
}
