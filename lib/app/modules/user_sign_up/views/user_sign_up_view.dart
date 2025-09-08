
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/modules/user_sign_up/views/sign_up_form.dart';
import '../controllers/user_sign_up_controller.dart';

class UserSignUpView extends GetView<UserSignUpController> {
  const UserSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 16,right: 16,bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.arrow_back,color: AppColors.white,),
                    ),
                  ),
                ),
              ),
              Obx(() => DottedBorder(
                borderType: BorderType.Circle,
                color: const Color(0xFF3465C2),
                dashPattern: [8, 3],
                strokeWidth: 1.w,
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFECECEC),
                    shape: BoxShape.circle,
                  ),
                  child: controller.profileImage.value == null
                      ? GestureDetector(
                    onTap: controller.pickImageFromCamera,
                    child: Center(
                      child: Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: const BoxDecoration(
                          color: Color(0xFFDBE7FF),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: const BoxDecoration(
                              color: Color(0xFFDBE7FF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                      : ClipOval(
                    child: Image.file(
                      controller.profileImage.value!,
                      fit: BoxFit.cover,
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                ),
              ),),
              SizedBox(height: 8.h),
              Text('Profile Picture', style: AppTextStyles.regular12),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: controller.pickImageFromGallery,
                child: Container(
                  height: 33.h,
                  width: 153.w,
                  color: AppColors.backGroundGrey,
                  child: Center(child: Text('Upload an Image')),
                ),
              ),
              SizedBox(height: 10.h),
              SignUpForm(controller: controller),
              Obx(
                () => CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Remember Me', style: AppTextStyles.regular16),
                  value: controller.isChecked.value,
                  onChanged: (val) => controller.checked(),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                          controller.signUp();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightBlack,
                    foregroundColor: AppColors.white,
                  ),
                  child: const Text('Sign Up'),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
