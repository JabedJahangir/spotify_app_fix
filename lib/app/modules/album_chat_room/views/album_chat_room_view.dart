import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';

import '../controllers/album_chat_room_controller.dart';

class AlbumChatRoomView extends GetView<AlbumChatRoomController> {
  const AlbumChatRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(title: "Chatroom Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Colors.lightGreenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            ImagePath.rectangle,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Song name here',
                                style: AppTextStyles.medium20,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                'Album Name here',
                                style: AppTextStyles.light16,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Row(
                                children: [
                                  SizedBox(),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous_outlined,size: 30,)),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.pause_outlined,size: 30,)),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.skip_next_outlined,size: 30,)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text('Hello')
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
