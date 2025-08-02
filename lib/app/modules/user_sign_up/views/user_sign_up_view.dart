import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';

import '../controllers/user_sign_up_controller.dart';

class UserSignUpView extends GetView<UserSignUpController> {
  const UserSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(child: Icon(Icons.add)),
                    Text('Profile Picture'),
                    Container(
                      height: 33,
                      width: 153,
                      color: AppColors.backGroundGrey,
                      child: Center(child: Text('Upload an Image')),
                    ),
                    SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('First Name'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: AppTextStyles.regular16.copyWith(color: AppColors.lightGrey)
                            ),
                          ),
                        ),
                        Text('Last Name'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Last Name',
                                hintStyle: AppTextStyles.regular16.copyWith(color: AppColors.lightGrey)
                            ),
                          ),
                        ),
                        Text('User Name'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'User Name',
                                hintStyle: AppTextStyles.regular16.copyWith(color: AppColors.lightGrey)
                            ),
                          ),
                        ),
                        Text('Email'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: AppTextStyles.regular16.copyWith(color: AppColors.lightGrey)
                            ),
                          ),
                        ),
                        Text('Password'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: AppTextStyles.regular16.copyWith(color: AppColors.lightGrey)
                            ),
                          ),
                        ),
                        Obx(
                              () => CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text('Remember Me'),
                            value: controller.isChecked.value,
                            onChanged: (val) {
                              controller.checked();
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
