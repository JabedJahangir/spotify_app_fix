import 'package:flutter/material.dart';
import 'spotify_service.dart';

class AlbumSearchScreen extends StatefulWidget {
  const AlbumSearchScreen({super.key});

  @override
  State<AlbumSearchScreen> createState() => _AlbumSearchScreenState();
}

class _AlbumSearchScreenState extends State<AlbumSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  SpotifyService spotifyService = SpotifyService();
  List<dynamic> _albums = [];
  bool _isLoading = false;

  Future<void> _search() async {
    setState(() => _isLoading = true);
    final results = await [];
    setState(() {
      _albums = results;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Spotify Album Search")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔎 Search bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Search for albums...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(icon: const Icon(Icons.search), onPressed: _search),
              ],
            ),

            const SizedBox(height: 16),

            // 📀 Album results
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _albums.length,
                      itemBuilder: (context, index) {
                        final album = _albums[index];
                        final imageUrl = album["images"].isNotEmpty
                            ? album["images"][0]["url"]
                            : null;
                        return ListTile(
                          leading: imageUrl != null
                              ? Image.network(imageUrl, width: 50, height: 50)
                              : const Icon(Icons.album),
                          title: Text(album["name"] ?? "Unknown Album"),
                          subtitle: Text(
                            album["artists"]
                                    ?.map((a) => a["name"])
                                    ?.join(", ") ??
                                "Unknown Artist",
                          ),
                          onTap: () {
                            // 👉 You can later open album details here
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
