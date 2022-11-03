part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class DataEventGetUser extends DataEvent {
  const DataEventGetUser();
}

class DataEventUploadAvatar extends DataEvent {
  const DataEventUploadAvatar();
}

class DataEventLogout extends DataEvent {
  const DataEventLogout();
}