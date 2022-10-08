import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerBloc() : super(VideoPlayerInitial()) {
    on<VideoPlayerEventInit>(_onInit);
    on<VideoPlayerEventChangeState>(_onChange);
  }

  FutureOr<void> _onInit(VideoPlayerEventInit event, Emitter<VideoPlayerState> emit) async {
    await VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      .initialize().then((value) {
        emit(VideoPlayerStateStopping());
    });
  }

  FutureOr<void> _onChange(VideoPlayerEventChangeState event, Emitter<VideoPlayerState> emit) {
  }
}
