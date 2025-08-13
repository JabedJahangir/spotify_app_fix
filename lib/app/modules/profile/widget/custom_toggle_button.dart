import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../data/app_colors.dart';
import '../controllers/profile_controller.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    super.key,
    required this.controller,
  });

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
      MediaQuery.of(context).orientation ==
          Orientation.portrait
          ? 30.h
          : 60.h,
      width: 50.w,
      child: Obx(
            () => GestureDetector(
          onTap:
          controller.togglePlayInBackground,
          child: Container(
            height:
            MediaQuery.of(
              context,
            ).orientation ==
                Orientation.portrait
                ? 25.h
                : 40.h,
            width: 46.w,
            decoration: BoxDecoration(
              color: AppColors.darkBlue,
              borderRadius: BorderRadius.circular(
                45.r,
              ),
            ),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height:
                  MediaQuery.of(
                    context,
                  ).orientation ==
                      Orientation.portrait
                      ? 20.h
                      : 30.h,
                  width:
                  MediaQuery.of(
                    context,
                  ).orientation ==
                      Orientation.portrait
                      ? 20.w
                      : 20.w,
                  decoration: BoxDecoration(
                    color:
                    controller
                        .isPlayInBackground
                        .value
                        ? AppColors.white
                        : AppColors.darkBlue,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height:
                  MediaQuery.of(
                    context,
                  ).orientation ==
                      Orientation.portrait
                      ? 20.h
                      : 30.h,
                  width:
                  MediaQuery.of(
                    context,
                  ).orientation ==
                      Orientation.portrait
                      ? 20.w
                      : 20.w,
                  decoration: BoxDecoration(
                    color:
                    controller
                        .isPlayInBackground
                        .value
                        ? AppColors.darkBlue
                        : AppColors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
