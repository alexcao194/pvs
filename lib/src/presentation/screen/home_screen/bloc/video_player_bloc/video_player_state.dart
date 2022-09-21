part of 'video_player_bloc.dart';

abstract class VideoPlayerState extends Equatable {
  const VideoPlayerState();
}

class VideoPlayerInitial extends VideoPlayerState {
  @override
  List<Object> get props => [];
}
