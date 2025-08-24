class Album {
  final String image;
  final String name;
  final String artist;

  Album({required this.image, required this.name, required this.artist});

  // Convert Album → Map (for JSON)
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'artist': artist,
    };
  }

  // Convert Map → Album (from JSON)
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      artist: json['artist'] ?? '',
    );
  }
}
