import 'dart:async';
import 'package:get/get.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:tanit_tanit_app/spotify_service.dart';

class SpotifyPlayerController extends GetxController {
  final SpotifyService spotifyService = SpotifyService();
  
  // Player state
  var currentTrackName = ''.obs;
  var currentAlbumName = ''.obs;
  var currentArtistName = ''.obs;
  var currentImageUrl = ''.obs;
  var currentTrackDuration = '0:00'.obs;
  var currentTrackProgress = 0.0.obs;
  var isPlaying = false.obs;
  var currentTrackIndex = 0.obs;
  var tracksList = <Map<String, String>>[].obs;
  var currentAlbumImage = ''.obs;
  var totalTrackDuration = '0:00'.obs;
  var currentPosition = 0.0.obs;
  var totalDuration = 0.0.obs;

  Timer? _progressTimer;

  @override
  void onClose() {
    _progressTimer?.cancel();
    super.onClose();
  }

  Future<void> playTrack(int index) async {
    if (index < 0 || index >= tracksList.length) return;
    
    try {
      final track = tracksList[index];
      currentTrackIndex.value = index;
      currentTrackName.value = track['name'] ?? '';
      currentAlbumName.value = track['albumName'] ?? '';
      currentArtistName.value = track['artistName'] ?? '';
      currentImageUrl.value = track['image_url']?.isNotEmpty == true 
          ? track['image_url']! 
          : currentAlbumImage.value;
      
      // Parse duration from milliseconds
      final durationMs = int.tryParse(track['duration'] ?? '0') ?? 0;
      totalDuration.value = durationMs / 1000.0;
      totalTrackDuration.value = _formatDuration(totalDuration.value);
      currentPosition.value = 0.0;
      currentTrackDuration.value = '0:00';
      currentTrackProgress.value = 0.0;
      
      await SpotifyService.connectToSpotifyRemote();
      await SpotifySdk.play(spotifyUri: 'spotify:track:${track['id']}');
      isPlaying.value = true;

      _startProgressTimer();
    } catch (e) {
      print('Error playing track: $e');
    }
  }

  String _formatDuration(double seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = (seconds % 60).floor();
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _startProgressTimer() {
    _progressTimer?.cancel();
    _progressTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!isPlaying.value) {
        timer.cancel();
        return;
      }
      
      if (currentPosition.value < totalDuration.value) {
        currentPosition.value += 1;
        currentTrackDuration.value = _formatDuration(currentPosition.value);
        currentTrackProgress.value = currentPosition.value / totalDuration.value;
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> seekToPosition(double positionPercentage) async {
    try {
      final positionMs = (totalDuration.value * positionPercentage * 1000).toInt();
      await SpotifySdk.seekTo(positionedMilliseconds: positionMs);
      
      currentPosition.value = totalDuration.value * positionPercentage;
      currentTrackDuration.value = _formatDuration(currentPosition.value);
      currentTrackProgress.value = positionPercentage;
    } catch (e) {
      print('Error seeking: $e');
    }
  }

  Future<void> pauseTrack() async {
    try {
      await SpotifySdk.pause();
      isPlaying.value = false;
      _progressTimer?.cancel();
    } catch (e) {
      print('Error pausing track: $e');
    }
  }

  Future<void> resumeTrack() async {
    try {
      await SpotifySdk.resume();
      isPlaying.value = true;
      _startProgressTimer();
    } catch (e) {
      print('Error resuming track: $e');
    }
  }

  Future<void> playNextTrack() async {
    if (currentTrackIndex.value < tracksList.length - 1) {
      await playTrack(currentTrackIndex.value + 1);
    }
  }

  Future<void> playPreviousTrack() async {
    if (currentTrackIndex.value > 0) {
      await playTrack(currentTrackIndex.value - 1);
    }
  }

  void setTracksList(List<Map<String, String>> tracks, String albumImage) {
    tracksList.value = tracks;
    currentAlbumImage.value = albumImage;
  }

  void clearPlayer() {
    currentTrackName.value = '';
    currentAlbumName.value = '';
    currentArtistName.value = '';
    currentImageUrl.value = '';
    currentTrackDuration.value = '0:00';
    currentTrackProgress.value = 0.0;
    isPlaying.value = false;
    currentTrackIndex.value = 0;
    tracksList.clear();
    currentAlbumImage.value = '';
    totalTrackDuration.value = '0:00';
    currentPosition.value = 0.0;
    totalDuration.value = 0.0;
    _progressTimer?.cancel();
  }
}