import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';
import 'package:tanit_tanit_app/app/routes/app_pages.dart';

import '../../../data/app_text_styles.dart';
import '../../../data/image_path.dart';
import '../controllers/login_in_input_controller.dart';

class LoginInInputView extends GetView<LoginInInputController> {
  const LoginInInputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(backGroundColor: AppColors.darkBlue),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.backGroundWhite,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Email'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Your Email',
                            fillColor: AppColors.white,
                          ),
                        ),
                      ),
                      Text('Password'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 16),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            fillColor: AppColors.white,
                          ),
                        ),
                      ),
                      Obx(
                        () => CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Forgot your password'),
                          value: controller.isChecked.value,
                          onChanged: (val) {
                            controller.checked();
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightBlack,
                        ),
                        child: Text(
                          'Log In',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            'Or',
                            style: AppTextStyles.regular16.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.backGroundGrey
                          ),
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.white,
                            child: Image.asset(
                              ImagePath.googleIcon,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Login In With Google',
                            style: TextStyle(color: AppColors.grey),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
