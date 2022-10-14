import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(const ImagePickerInitial()) {
    on<ImagePickerEventOnPick>(_onPick);
    on<ImagePickerEventReset>(_onReset);
  }

  FutureOr<void> _onPick(ImagePickerEventOnPick event, Emitter<ImagePickerState> emit) async {
    
  }

  FutureOr<void> _onReset(ImagePickerEventReset event, Emitter<ImagePickerState> emit) {
    emit(const ImagePickerInitial());
  }
}
