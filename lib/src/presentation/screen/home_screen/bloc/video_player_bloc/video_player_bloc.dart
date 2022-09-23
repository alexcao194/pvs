import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerBloc() : super(VideoPlayerInitial()) {
    on<VideoPlayerEventInitDone>(_onInit);
    on<VideoPlayerEventChangeState>(_onChange);
  }

  FutureOr<void> _onInit(VideoPlayerEventInitDone event, Emitter<VideoPlayerState> emit) {
    emit(VideoPlayerStateWaiting(controller: event.controller));
  }

  FutureOr<void> _onChange(VideoPlayerEventChangeState event, Emitter<VideoPlayerState> emit) {
  }
}
