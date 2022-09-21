import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(const ImagePickerInitial()) {
    on<ImagePickerEventOnPick>(_onPick);
  }

  FutureOr<void> _onPick(ImagePickerEventOnPick event, Emitter<ImagePickerState> emit) async {
    final ImagePicker _picker = ImagePicker();
    await _picker.pickImage(source: ImageSource.gallery)
    .then((value) {
      if(value != null) {
        emit(ImagePickerStatePicked(image: value));
      }
    });
  }
}
