// search_view.dart

import 'package:flutter/material.dart' hide SearchController;

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/search/views/Albums.dart';
import 'package:tanit_tanit_app/app/modules/search/views/All.dart';
import 'package:tanit_tanit_app/app/modules/search/views/Artists.dart';
import 'package:tanit_tanit_app/app/modules/search/views/Genres.dart';

import '../controllers/search_controller.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
final CustomSearchController controller = Get.find<CustomSearchController>();
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil (if not initialized in root)
    ScreenUtil.init(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.backGroundWhite,
        appBar: AppBar(
          title: Text('Search'),
          backgroundColor: AppColors.backGroundWhite,
          titleTextStyle: AppTextStyles.medium24.copyWith(
            color: AppColors.black,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: TextFormField(
                controller: searchController,
                onFieldSubmitted: (value) async {
                  if (value.isNotEmpty) {
                    await controller.search(value);
                    searchController.clear();
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: AppTextStyles.regular16.copyWith(
                    color: AppColors.greyTextColor,
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Image.asset(
                      ImagePath.searchNormal,
                      height:
                          MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 18.h
                          : 60.h,
                      width:
                          MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 18.h
                          : 60.h,
                    ),
                  ),
                  border: InputBorder.none,
                ),
                style: AppTextStyles.regular16.copyWith(fontSize: 16.sp),
              ),
            ),
            TabBar(
              unselectedLabelStyle: AppTextStyles.regular14.copyWith(
                color: AppColors.black,
                fontSize: 14.sp,
              ),
              labelStyle: AppTextStyles.regular14.copyWith(
                color: AppColors.darkBlue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              labelColor: AppColors.darkBlue,
              indicatorColor: AppColors.darkBlue,
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Albums'),
                Tab(text: 'Artists'),
                Tab(text: 'Genres'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [All(), Albums(), Artists(), Genres()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
