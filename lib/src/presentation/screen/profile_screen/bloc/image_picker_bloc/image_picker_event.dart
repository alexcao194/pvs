part of 'image_picker_bloc.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class ImagePickerEventOnPick extends ImagePickerEvent {
  const ImagePickerEventOnPick({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

class ImagePickerEventReset extends ImagePickerEvent {
  const ImagePickerEventReset();
}
