import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/artist_profile/widget/album_card_list.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';

import '../controllers/album_controller.dart';

class AlbumView extends GetView<AlbumController> {

  const AlbumView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      appBar: AppBar(
        title: Text('Favourite Albums', style: AppTextStyles.medium24),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*.84,
              child: ListView.builder(
                physics: ScrollPhysics(),
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (context, index) => AlbumCardList(isTrue: true,),),
            ),
          ],
        ),
      ),
    );
  }
}
