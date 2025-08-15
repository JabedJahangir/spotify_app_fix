import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/modules/home/views/home_view.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3), () => FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.offAllNamed(Routes.CUSTOM_BOTTOM_NAVIGATION_BAR);
      }
    }));
  }
}
