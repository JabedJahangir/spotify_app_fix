import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

import '../../data/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String? image;
  final String? richText1;
  final String? richText2;
  final String? title;
  final IconData? icon;
  final Color? backGroundColor;
  final Color? titleColor;
  final Function()? backRoutes;
  final String? iconPath;

  const CustomAppBar({
    super.key,
    this.image,
    this.icon,
    this.richText1,
    this.richText2,
    this.title,
    this.backGroundColor = AppColors.backGroundWhite,
    this.backRoutes,
    this.titleColor = AppColors.black,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGroundColor,
      scrolledUnderElevation: 0,
      leadingWidth: 56.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 28.r,
              backgroundColor: AppColors.blue,
              child: image != null
                  ? ClipOval(
                      child: image!.startsWith("http")
                          ? Image.network(
                              image!,
                              fit: BoxFit.cover,
                              // width: 56.w,
                              // height: 40.w,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/person.png', // your default asset
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                          : Image.asset(
                              image!,
                              fit: BoxFit.cover,
                              // width: 56.w,
                              // height: 56.w,
                            ),
                    )
                  : IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Center(child: Icon(Icons.arrow_back, size: 24.h)),
                      color: AppColors.white,
                      iconSize: 24.h,
                    ),
            ),
          ],
        ),
      ),
      title: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: richText1 != null
            ? TextSpan(
                children: [
                  TextSpan(
                    text: richText1,
                    style: AppTextStyles.regular16.copyWith(
                      color: AppColors.darkBlue,
                      fontSize: 16.h,
                    ),
                  ),
                  TextSpan(
                    text: richText2,
                    style: AppTextStyles.bold24.copyWith(
                      color: AppColors.darkBlue,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              )
            : TextSpan(
                text: title,
                style: AppTextStyles.medium24.copyWith(
                  color: titleColor,
                  fontSize: 24.h,
                ),
              ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(iconPath!);
            },
            child: Icon(icon, color: AppColors.darkBlue, size: 40.sp),
          ),
        ),
      ],
    );
  }
}
