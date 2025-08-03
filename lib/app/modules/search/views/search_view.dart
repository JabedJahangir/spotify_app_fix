import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide SearchController;

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/search/views/Albums.dart';
import 'package:tanit_tanit_app/app/modules/search/views/All.dart';
import 'package:tanit_tanit_app/app/modules/search/views/Artists.dart';
import 'package:tanit_tanit_app/app/modules/search/views/Genres.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.backGroundWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(title: 'Search'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: AppColors.greyTextColor),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      ImagePath.searchNormal,
                      height: 24,
                      width: 24,
                    ),
                  ), //height width choto kore dau
                  border: InputBorder.none,
                ),
              ),
            ),
            TabBar(
              unselectedLabelStyle: AppTextStyles.regular14.copyWith(color: AppColors.black),
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Albums'),
                  Tab(text: 'Artists'),
                  Tab(text: 'Genres'),
                ]),
            Expanded(child: TabBarView(children: [
              All(),
              Albums(),
              Artists(),
              Genres(),
            ]))
          ],
        ),
      ),
    );
  }
}
