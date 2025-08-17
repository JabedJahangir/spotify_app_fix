import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpotifyService {
  // Fetch client id & secret from Firestore
  Future<Map<String, String>?> _getSecrets() async {
    final doc = await FirebaseFirestore.instance
        .collection('config')
        .doc('spotify')
        .get();
    if (!doc.exists) return null;
    final data = doc.data()!;
    return {
      "client_id": data["client_id"],
      "client_secret": data["client_secret"],
    };
  }

  // Get access token using Client Credentials Flow
  Future<String?> getAccessToken() async {
    final secrets = await _getSecrets();
    if (secrets == null) return null;

    final creds = base64Encode(
      utf8.encode('${secrets["client_id"]}:${secrets["client_secret"]}'),
    );

    final response = await http.post(
      Uri.parse("https://accounts.spotify.com/api/token"),
      headers: {
        "Authorization": "Basic $creds",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {"grant_type": "client_credentials"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["access_token"];
    } else {
      print("❌ Failed to get token: ${response.body}");
      return null;
    }
  }

  // Search albums
  Future<List<dynamic>> searchAlbums(String query) async {
    final token = await getAccessToken();
    if (token == null) return [];

    final response = await http.get(
      Uri.parse(
        "https://api.spotify.com/v1/search?q=$query&type=album&limit=10",
      ),
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["albums"]["items"];
    } else {
      print("❌ Search failed: ${response.body}");
      return [];
    }
  }

  // Get trending albums (New Releases)
  Future<List<dynamic>> getTrendingAlbums() async {
    final token = await getAccessToken();
    if (token == null) return [];

    final response = await http.get(
      Uri.parse(
        "https://api.spotify.com/v1/browse/new-releases?limit=30&country=US",
      ),
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["albums"]["items"];
    } else {
      print("❌ Failed to get trending albums: ${response.body}");
      return [];
    }
  }

  Future<Map<String, dynamic>?> getArtist(String artistId) async {
    final token = await getAccessToken();
    if (token == null) return null;

    final response = await http.get(
      Uri.parse("https://api.spotify.com/v1/artists/$artistId"),
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("❌ Failed to get artist: ${response.body}");
      return null;
    }
  }

  // Fetch all albums of an artist
  Future<List<Map<String, String>>> getArtistAlbums(String artistId) async {
    final token = await getAccessToken();
    final url = Uri.parse(
      'https://api.spotify.com/v1/artists/$artistId/albums?include_groups=album,single&market=US&limit=50',
    );

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    print("Spotify API status code: ${response.statusCode}");
    print("Spotify API response body: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final albums = data['items'] as List<dynamic>;

      // Map to name + image
      final albumsList = albums.map((a) {
        final album = a as Map<String, dynamic>;
        final name = album['name']?.toString() ?? 'Unknown Album';
        final imageUrl = (album['images'] as List<dynamic>?)?.isNotEmpty == true
            ? album['images'][0]['url'].toString()
            : '';
        return {'name': name, 'image': imageUrl};
      }).toList();

      // Remove duplicates by name
      final uniqueAlbums = {
        for (var a in albumsList) a['name']!: a,
      }.values.toList();

      print("Total albums fetched: ${uniqueAlbums.length}");
      return uniqueAlbums;
    } else {
      print("Failed to fetch albums, status code: ${response.statusCode}");
      return [];
    }
  }
  Future<List<Map<String, String>>> getAlbumTracksWithImages(String albumId) async {
  try {
    final token = await getAccessToken();

    // Fetch basic album tracks
    final url = 'https://api.spotify.com/v1/albums/$albumId/tracks?limit=50';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      debugPrint("❌ Failed to fetch album tracks: ${response.body}");
      return [];
    }

    final data = jsonDecode(response.body);
    final List tracksList = data['items'];

    // Fetch track details individually to get image
    final List<Future<Map<String, String>>> trackFutures = tracksList.map<Future<Map<String, String>>>((track) async {
      final trackId = (track['id'] ?? '').toString();
      final trackResponse = await http.get(
        Uri.parse('https://api.spotify.com/v1/tracks/$trackId'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (trackResponse.statusCode != 200) {
        return {
          'id': trackId,
          'name': (track['name'] ?? '').toString(),
          'duration': (track['duration_ms'] ?? '').toString(),
          'preview_url': (track['preview_url'] ?? '').toString(),
          'image_url': '',
        };
      }

      final trackData = jsonDecode(trackResponse.body);

      final imageUrl = (trackData['album']?['images'] as List?)?.isNotEmpty == true
          ? (trackData['album']['images'][0]['url'] ?? '').toString()
          : '';

      return {
        'id': trackId,
        'name': (track['name'] ?? '').toString(),
        'duration': (track['duration_ms'] ?? '').toString(),
        'preview_url': (track['preview_url'] ?? '').toString(),
        'image_url': imageUrl,
      };
    }).toList();

    final tracksWithImages = await Future.wait(trackFutures);
    return tracksWithImages;
  } catch (e) {
    debugPrint("❌ Error in getAlbumTracksWithImages: $e");
    return [];
  }
}


}
