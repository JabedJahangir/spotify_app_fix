import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
            height: 135,
            viewportFraction: 1,
            aspectRatio: 16/9,
            enlargeCenterPage: false,
            onPageChanged: (int page, _) {
              _selectedSlider.value = page;
            },
          ),
          items: [1, 2, 3, 4].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 3),
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
                            Spacer(),
                            SizedBox(
                              height: 26,
                              width: 109,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal:2)
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
                            const SizedBox(height: 3),
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                          height: 100,
                          width: 104,
                          child: Image.asset(ImagePath.sliderImage),
                        ),
                      ],
                    ),
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
