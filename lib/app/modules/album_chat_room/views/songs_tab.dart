import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/modules/artist_profile/widget/album_card_list.dart';
import 'package:tanit_tanit_app/app/spotify_player_controller.dart';


class SongsTab extends StatelessWidget {
  const SongsTab({
    super.key,
    required this.albumId,
    required this.artistId,
    required this.image,
    required this.artistName,
  });

  final String albumId;
  final String image;
  final String artistName;
  final String artistId;
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SpotifyPlayerController>();
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
          // Store tracks in controller for navigation
          controller.setTracksList(tracks, image);

          return ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: tracks.length,
            itemBuilder: (context, index) {
              final track = tracks[index];
              final trackId = track['id'] ?? '';
              final trackName = track['name'] ?? '';

              return AlbumCardList(
                showIcon: false,
                image: image,
                artistName: artistName,
                albumName: trackName,
                icon: Icons.favorite_border_outlined,
                albumId: trackName,
                artistId: trackId,
                onTap: () => controller.playTrack(index),
              );
            },
          );
        }
      },
    );
  }
}
