import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../controllers/start_now_controller.dart';

class StartNowView extends GetView<StartNowController> {
  const StartNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(ImagePath.startNow, fit: BoxFit.cover),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Image.asset(ImagePath.mumuLogo, width: 140, height: 130),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    child: Text('Start Now',),

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
