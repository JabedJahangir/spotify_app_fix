import 'package:flutter/cupertino.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/artist_profile/widget/album_card_list.dart';

class SongsTab extends StatelessWidget {
  const SongsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .6,
          child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) =>
                AlbumCardList(isTrue: true, image: ImagePath.heart),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
