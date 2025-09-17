// app/models/album_model.dart
class Album {
  final String id;        // albumId
  final String name;
  final String artist;
  final String artistId;  // artistId
  final String image;

  Album({
    required this.id,
    required this.name,
    required this.artist,
    required this.artistId,
    required this.image,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        artist: json['artist'] ?? '',
        artistId: json['artistId'] ?? '',
        image: json['image'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'artist': artist,
        'artistId': artistId,
        'image': image,
      };
}

