import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:pvs/src/service/http.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer.network(
          'http://${HTTP.ip4}/video/demo.mp4',
          betterPlayerConfiguration: const BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
          ),
        ),
      ),
    );
  }
}
