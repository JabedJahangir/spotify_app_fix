import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';

import '../../artist_profile/widget/album_card_list.dart';

class Albums extends StatelessWidget {
  const Albums({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .02),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text("Albums", style: AppTextStyles.regular24),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) => AlbumCardList(
              artistName: '',
              albumName: '',
              icon: Icons.favorite_outline_rounded,
            ),
          ),
        ),
      ],
    );
  }
}
