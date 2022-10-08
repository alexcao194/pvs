import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../bloc/video_player_bloc/video_player_bloc.dart';

class AppVideoPlayer extends StatelessWidget {
  const AppVideoPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
      builder: (context, playerState) {
        return Center(

        );
      },
    );
  }
}
