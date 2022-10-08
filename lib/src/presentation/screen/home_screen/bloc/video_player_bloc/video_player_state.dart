part of 'video_player_bloc.dart';

enum VideoState {
  playing,
  pausing,
  stopping,
}

abstract class VideoPlayerState extends Equatable {
  const VideoPlayerState();

  @override
  List<Object> get props => [];
}

class VideoPlayerInitial extends VideoPlayerState {

}

class VideoPlayerStatePlaying extends VideoPlayerState {

}

class VideoPlayerStatePausing extends VideoPlayerState {

}

class VideoPlayerStateStopping extends VideoPlayerState {

}

class VideoPlayerStateLoading extends VideoPlayerState {

}
