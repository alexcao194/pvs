part of 'video_player_bloc.dart';

abstract class VideoPlayerEvent extends Equatable {
  const VideoPlayerEvent({required this.controller});
  final VideoPlayerController controller;

  @override
  List<Object> get props => [controller];
}

class VideoPlayerEventInitDone extends VideoPlayerEvent {
  const VideoPlayerEventInitDone({required super.controller});
}

class VideoPlayerEventChangeState extends VideoPlayerEvent {
  const VideoPlayerEventChangeState({required super.controller});
}