import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/modules/home/views/home_view.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3), () => Get.offAllNamed(Routes.START_NOW));
  }
}
