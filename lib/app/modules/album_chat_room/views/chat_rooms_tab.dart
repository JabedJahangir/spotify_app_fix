import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

class ChatRoomsTab extends StatelessWidget {
  const ChatRoomsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 400.h,
          child: ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => Align(
              alignment: index.isEven
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: index.isEven
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(ImagePath.personImage),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              height: MediaQuery.of(context).orientation == Orientation.portrait ? 30.h : 60.h,
                              width: 200.w,
                              decoration: BoxDecoration(color: AppColors.white),
                              child: Text(
                                "Message $index",
                                style: AppTextStyles.light14.copyWith(
                                  color: index.isEven
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '5:16',
                            style: AppTextStyles.light8.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '5:16',
                            style: AppTextStyles.light8.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              height: MediaQuery.of(context).orientation == Orientation.portrait ? 30.h : 60.h,
                              width: 200.w,
                              decoration: BoxDecoration(color: AppColors.white),
                              child: Text(
                                "Message $index",
                                style: AppTextStyles.light14.copyWith(
                                  color: index.isEven
                                      ? Colors.black
                                      : Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(ImagePath.personImage),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).orientation == Orientation.portrait ? 50 : 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: MediaQuery.of(context).orientation == Orientation.portrait ? 35.h : 65.h, width: 230.w, child: SearchBar()),
              SizedBox(width: MediaQuery.of(context).size.width * .03),
              Container(
                height: MediaQuery.of(context).orientation == Orientation.portrait ? 40.h : 70.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: AppColors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Send',
                      style: AppTextStyles.light12.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send_outlined,
                        color: AppColors.white,
                        size: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
