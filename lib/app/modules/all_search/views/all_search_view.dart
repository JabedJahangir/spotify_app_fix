import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';

import '../controllers/all_search_controller.dart';

class AllSearchView extends GetView<AllSearchController> {
  const AllSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Column(children: [CustomAppBar()])),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    ListView.builder(
                       shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 15,
                        itemBuilder: (context,index){
                          return Card(
                            elevation: 1.2,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              width:double.infinity,
                              height: 64,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(8),
                                        bottom: Radius.circular(8),
                                      ),
                                      child: Image.asset(
                                        ImagePath.notificatonImage,
                                        height: 48,
                                        width: 48,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 12,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("New Release Alert",style: AppTextStyles.regular16.copyWith(color: AppColors.black),),
                                        Text("Fresh sounds just landed. Dive in now!",style: AppTextStyles.light10.copyWith(color: AppColors.black),),
                                      ],
                                    )

                                  ],
                                ),
                              ),
                            ),
                          );
                        })

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
