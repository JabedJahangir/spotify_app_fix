
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
                children: [
                  Text('Up coming Events',style: AppTextStyles.bold16.copyWith(color: AppColors.darkBlue )),
                  CarouselSlider(
                    options: CarouselOptions(height: 400.0),
                    items: [1,2,3,4,5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.amber
                              ),
                              child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              )

          )
        ],
      )
    );
  }
}
