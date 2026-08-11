class AudioItem {
  final String title;
  final String url;
  bool isPlaying;

  AudioItem({
    required this.title,
    required this.url,
    this.isPlaying = false,
  });
}
