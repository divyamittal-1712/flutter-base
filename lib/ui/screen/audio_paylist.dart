import 'package:base_flutter/base/base_state.dart';
import 'package:base_flutter/helpers/page_identifier.dart';
import 'package:base_flutter/ui/common/app_bar_widget.dart';
import 'package:base_flutter/ui/screen/navigator/audio_play_navigator.dart';
import 'package:base_flutter/ui/screen/viewModel/audio_play_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AudioPayList extends StatefulWidget {
  const AudioPayList({super.key});

  @override
  State<AudioPayList> createState() => _AudioPayListState();
}

class _AudioPayListState extends BaseState<AudioPayList, AudioPlayViewModel>
    implements AudioPlayNavigator {
  @override
  AppBarWidget? buildAppBar() {
    return null;
  }

  /*@override
  Widget buildBody() {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio List')),
      body: Consumer<AudioPlayViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.audioList.length,
            itemBuilder: (context, index) {
              final audio = viewModel.audioList[index];
              final isCurrentlyPlaying = viewModel.isIndexPlaying(index);

              print("playAudio44 ${audio.isPlaying}");
              return ListTile(
                title: Text(audio.title),
                trailing: IconButton(
                  icon: Icon(isCurrentlyPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: () {
                    viewModel.togglePlayPause(index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }*/



  @override
  Widget buildBody() {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio List')),
      body: Consumer<AudioPlayViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              // Audio List
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.audioList.length,
                  itemBuilder: (context, index) {
                    final audio = viewModel.audioList[index];
                    final isCurrentlyPlaying = viewModel.currentlyPlayingIndex == index && audio.isPlaying;

                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ListTile(
                        title: Text(audio.title),
                        trailing: IconButton(
                          icon: Icon(
                            isCurrentlyPlaying ? Icons.pause : Icons.play_arrow,
                            size: 32,
                          ),
                          onPressed: () {
                            viewModel.togglePlayPause(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Audio Control Panel (only show when audio is loaded)
              if (viewModel.currentlyPlayingIndex != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Currently playing title
                      Text(
                        viewModel.audioList[viewModel.currentlyPlayingIndex!].title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Seek bar
                      Row(
                        children: [
                          // Current time
                          Text(
                            viewModel.formatDuration(viewModel.currentPosition),
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 8),

                          // Slider
                          Expanded(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                                trackHeight: 4,
                              ),
                              child: Slider(
                                value: viewModel.progress.clamp(0.0, 1.0),
                                onChangeStart: (value) => viewModel.onSeekStart(),
                                onChanged: (value) => viewModel.onSeekUpdate(value),
                                onChangeEnd: (value) => viewModel.onSeekEnd(value),
                                activeColor: Theme.of(context).primaryColor,
                                inactiveColor: Colors.grey[300],
                              ),
                            ),
                          ),

                          const SizedBox(width: 8),
                          // Total duration
                          Text(
                            viewModel.formatDuration(viewModel.totalDuration),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Play/Pause button
                      IconButton(
                        onPressed: () {
                          if (viewModel.currentlyPlayingIndex != null) {
                            viewModel.togglePlayPause(viewModel.currentlyPlayingIndex!);
                          }
                        },
                        icon: Icon(
                          viewModel.audioList[viewModel.currentlyPlayingIndex!].isPlaying
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_filled,
                          size: 48,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }



  @override
  getNavigator() {
    return this;
  }

  @override
  PageIdentifier getPageIdentifier() {
    return PageIdentifier.audioPlayer;
  }

  @override
  void loadPageData({value}) {}

  @override
  Future<bool> provideOnWillPopScopeCallBack() async {
    return true;
  }
}
