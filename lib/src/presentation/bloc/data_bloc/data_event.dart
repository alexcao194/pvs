part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  final User user;
  const DataEvent({required this.user});

  @override
  List<Object> get props => [];
}

class DataEventGetUser extends DataEvent {
  const DataEventGetUser({required super.user});
}

class DataEventUploadAvatar extends DataEvent {
  const DataEventUploadAvatar({required super.user});
}
