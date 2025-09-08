import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      Duration(seconds: 3),
      () => FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Get.offAllNamed(Routes.LOGIN);
        } else {
          // Check if new user
          final creationTime = user.metadata.creationTime;
          final lastSignInTime = user.metadata.lastSignInTime;

          if (creationTime != null &&
              lastSignInTime != null &&
              creationTime == lastSignInTime) {
            // Brand new user → go to Finish
            Get.offAllNamed(Routes.FINISH);
          } else {
            // Existing user → go to Dashboard
            Get.offAllNamed(Routes.CUSTOM_BOTTOM_NAVIGATION_BAR);
          }
        }
      }),
    );
  }
}
