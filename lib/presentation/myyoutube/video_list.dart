import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates list of video players
class VideoList extends StatefulWidget {
  const VideoList({super.key});

  @override
  State<VideoList> createState() => _VideoListState();
}

// https://youtu.be/_9-LcHUpY98?si=lz4O_d-8acLmaxJM
// https://youtu.be/eJlqUCFeZjs?si=1ogfmIlmMlriFqdm
// https://youtu.be/k3fpS-VZi78?si=dt6AKJxNlc1iqW_8
class _VideoListState extends State<VideoList> {
  final List<YoutubePlayerController> _controllers = [
    '_9-LcHUpY98',
    'eJlqUCFeZjs',
    'k3fpS-VZi78',
    // 'KmzdUe0RSJo',
    // '6jZDSSZZxjQ',
    // 'p2lYr3vM_1w',
    // '7QUtEmBT_-w',
    // '34_PXCzGw1M',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Vedio List'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return YoutubePlayer(
            key: ObjectKey(_controllers[index]),
            controller: _controllers[index],
            actionsPadding: const EdgeInsets.only(left: 16.0),
            bottomActions: const [
              CurrentPosition(),
              SizedBox(width: 10),
              ProgressBar(isExpanded: true),
              SizedBox(width: 10),
              RemainingDuration(),
              FullScreenButton(),
            ],
          );
        },
        itemCount: _controllers.length,
        separatorBuilder: (context, _) => const SizedBox(height: 10.0),
      ),
    );
  }
}
