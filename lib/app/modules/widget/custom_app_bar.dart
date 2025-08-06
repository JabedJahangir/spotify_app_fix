import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGroundColor,
      toolbarHeight: MediaQuery.of(context).orientation == Orientation.portrait ? 50.h : 44.h,
      leadingWidth: MediaQuery.of(context).orientation == Orientation.portrait
          ? 56.w
          : 48.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 16),
        child: Stack(
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 28.r
                  : 20.r,
              backgroundColor: AppColors.blue,
              child: image != null
                  ? ClipOval(child: Image.asset(image!, fit: BoxFit.cover))
                  : IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Center(
                        child: Icon(
                          Icons.arrow_back,
                          size:
                              MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 24.h
                              : 14.h,
                        ),
                      ),
                      color: AppColors.white,
                      iconSize:
                          MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 24.h
                          : 16.h,
                    ),
            ),
          ],
        ),
      ),
      title: RichText(
        text: richText1 != null
            ? TextSpan(
                children: [
                  TextSpan(
                    text: richText1,
                    style: AppTextStyles.regular16.copyWith(
                      color: AppColors.darkBlue,
                      fontSize:
                          MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 16.sp
                          : 14.sp,
                    ),
                  ),
                  TextSpan(
                    text: richText2,
                    style: AppTextStyles.bold24.copyWith(
                      color: AppColors.darkBlue,
                      overflow: TextOverflow.ellipsis,
                      fontSize:
                          MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 24.sp
                          : 20.sp,
                    ),
                  ),
                ],
              )
            : TextSpan(
                text: title,
                style: AppTextStyles.medium24.copyWith(
                  color: titleColor,
                  fontSize:
                      MediaQuery.of(context).orientation == Orientation.portrait
                      ? 24.sp
                      : 20.sp,
                ),
              ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              icon,
              color: AppColors.darkBlue,

              size: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 40.sp
                  : 32.sp,
            ),
          ),
        ),
      ],
    );
  }
}
