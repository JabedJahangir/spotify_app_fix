import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';

class HomeCarouselSlider extends StatelessWidget {
  const HomeCarouselSlider({
    super.key,
    required ValueNotifier<int> selectedSlider,
  }) : _selectedSlider = selectedSlider;

  final ValueNotifier<int> _selectedSlider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 184.h,
            viewportFraction: 1,
            aspectRatio: 16 / 9,
            enlargeCenterPage: false,
            onPageChanged: (int page, _) {
              _selectedSlider.value = page;
            },
          ),
          items: [1, 2, 3, 4].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 18, ),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Live at Grand Arena',
                            style: AppTextStyles.medium16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            'Jul 29, 2019 23:14',
                            style: AppTextStyles.regular8.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            'Artist Name/ Band name',
                            style: AppTextStyles.regular8.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          SizedBox(
                            height: 38.h,
                            width: 109.w,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 2),
                              ),
                              child: Center(
                                child: Text(
                                  'Buy Ticket',
                                  style: AppTextStyles.regular12.copyWith(
                                    color: AppColors.black,
                                    letterSpacing: 0.01,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          ImagePath.sliderImage,
                          scale: 4,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        ValueListenableBuilder(
          valueListenable: _selectedSlider,
          builder: (context, value, _) {
            List<Widget> list = [];
            for (int i = 0; i < 4; i++) {
              list.add(
                Container(
                  height: 10,
                  width: 10,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: value == i ? AppColors.darkBlue : Color(0xFFDDDDFF),
                  ),
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list,
            );
          },
        ),
      ],
    );
  }
}
