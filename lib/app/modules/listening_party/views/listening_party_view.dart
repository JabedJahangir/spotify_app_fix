import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_album_chat_room_player.dart';
import 'package:tanit_tanit_app/app/modules/widget/custom_app_bar.dart';

import '../controllers/listening_party_controller.dart';

class ListeningPartyView extends GetView<ListeningPartyController> {
  const ListeningPartyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundWhite,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), child: CustomAppBar(
        title: "Listening Parties",
      )),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAlbumChatRoomPlayer()
              ],
            ),
          )
        ],
      )
    );
  }
}
