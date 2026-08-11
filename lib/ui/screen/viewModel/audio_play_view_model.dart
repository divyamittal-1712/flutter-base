
import 'package:base_flutter/base/base_view_model.dart';
import 'package:just_audio/just_audio.dart';

import '../model/audio_item.dart';
import '../navigator/audio_play_navigator.dart';

class AudioPlayViewModel extends BaseViewModel<AudioPlayNavigator>{

  final AudioPlayer _player = AudioPlayer();
  int? _currentlyPlayingIndex;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isUserSeeking = false;

  final List<AudioItem> _audioList = [
    AudioItem(title: 'Audio 1', url: 'https://samplelib.com/lib/preview/mp3/sample-3s.mp3'),
    AudioItem(title: 'Audio 2', url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3'),
    AudioItem(title: 'Audio 3', url: 'https://ia600208.us.archive.org/14/items/testmp3testfile/mpthreetest.mp3'),
  ];

  List<AudioItem> get audioList => _audioList;
  int? get currentlyPlayingIndex => _currentlyPlayingIndex;
  Duration get currentPosition => _currentPosition;
  Duration get totalDuration => _totalDuration;
  bool get isUserSeeking => _isUserSeeking;

  // Get progress as a value between 0.0 and 1.0
  double get progress {
    if (_totalDuration.inMilliseconds == 0) return 0.0;
    return _currentPosition.inMilliseconds / _totalDuration.inMilliseconds;
  }

  AudioPlayViewModel() {
    // Listen to player state changes
    _player.playerStateStream.listen((state) {
      final isPlaying = state.playing;
      final isReady = state.processingState == ProcessingState.ready;
      final isCompleted = state.processingState == ProcessingState.completed;

      // Reset all items to not playing
      for (int i = 0; i < _audioList.length; i++) {
        _audioList[i].isPlaying = false;
      }

      // Update the currently playing item state
      if (_currentlyPlayingIndex != null) {
        if (isPlaying && (isReady || state.processingState == ProcessingState.loading)) {
          _audioList[_currentlyPlayingIndex!].isPlaying = true;
        }

        if (isCompleted) {
          _currentlyPlayingIndex = null;
          _currentPosition = Duration.zero;
        }
      }

      notifyListeners();
    });

    // Listen to position changes
    _player.positionStream.listen((position) {
      if (!_isUserSeeking) {
        _currentPosition = position;
        notifyListeners();
      }
    });

    // Listen to duration changes
    _player.durationStream.listen((duration) {
      _totalDuration = duration ?? Duration.zero;
      notifyListeners();
    });
  }

  Future<void> togglePlayPause(int index) async {
    try {
      // If a different audio is currently playing, stop it
      if (_currentlyPlayingIndex != null && _currentlyPlayingIndex != index) {
        await _player.stop();
        _audioList[_currentlyPlayingIndex!].isPlaying = false;
        _currentlyPlayingIndex = null;
        _currentPosition = Duration.zero;
        _totalDuration = Duration.zero;
      }

      final item = _audioList[index];

      if (_currentlyPlayingIndex == index && item.isPlaying) {
        // Currently playing this item, so pause it
        await _player.pause();
        item.isPlaying = false;
        _currentlyPlayingIndex = null;
      } else {
        // Not playing this item, so start playing it
        await _player.setUrl(item.url);
        _currentlyPlayingIndex = index;
        item.isPlaying = true;  // Set immediately for UI feedback
        notifyListeners();  // Notify immediately

        await _player.play();
      }

      notifyListeners();
    } catch (e) {
      print("Error playing audio: $e");
      // Reset state on error
      if (_currentlyPlayingIndex != null) {
        _audioList[_currentlyPlayingIndex!].isPlaying = false;
      }
      _currentlyPlayingIndex = null;
      _currentPosition = Duration.zero;
      _totalDuration = Duration.zero;
      notifyListeners();
    }
  }

  // Seek to a specific position
  Future<void> seekTo(Duration position) async {
    try {
      await _player.seek(position);
      _currentPosition = position;
      notifyListeners();
    } catch (e) {
      print("Error seeking: $e");
    }
  }

  // Called when user starts dragging the seek bar
  void onSeekStart() {
    _isUserSeeking = true;
  }

  // Called when user is dragging the seek bar
  void onSeekUpdate(double value) {
    if (_totalDuration.inMilliseconds > 0) {
      _currentPosition = Duration(
        milliseconds: (_totalDuration.inMilliseconds * value).round(),
      );
      notifyListeners();
    }
  }

  // Called when user finishes dragging the seek bar
  Future<void> onSeekEnd(double value) async {
    _isUserSeeking = false;
    if (_totalDuration.inMilliseconds > 0) {
      final position = Duration(
        milliseconds: (_totalDuration.inMilliseconds * value).round(),
      );
      await seekTo(position);
    }
  }

  // Format duration to display as MM:SS
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}