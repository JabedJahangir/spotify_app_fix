import 'package:flutter/cupertino.dart';
import 'package:tanit_tanit_app/app/modules/artist_profile/widget/album_card_list.dart';

import '../controllers/album_chat_room_controller.dart';

class SongsTab extends StatelessWidget {
  const SongsTab({
    super.key,
    required this.albumId,
    required this.controller,
    required artistId,
    required this.image,
    required this.artistName,
  });

  final String albumId;
  final String image;
  final String artistName;
  final AlbumChatRoomController controller;

  @override
  Widget build(BuildContext context) {
    print('✅ $artistName');
    return FutureBuilder<List<Map<String, String>>>(
      future: controller.spotifyService.getAlbumTracksWithImages(albumId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No songs found'));
        } else {
          final tracks = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: tracks.length,
            itemBuilder: (context, index) {
              final track = tracks[index];
              return AlbumCardList(
                isTrue: true,
                image: image,
                artistName: artistName, // fill if needed
                albumName: track['name'] ?? '',
              );
            },
          );
        }
      },
    );
  }
}
