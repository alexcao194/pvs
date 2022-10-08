import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pvs/src/presentation/screen/profile_screen/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:pvs/src/service/http.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(const ImagePickerInitial()) {
    on<ImagePickerEventOnPick>(_onPick);
    on<ImagePickerEventReset>(_onReset);
  }

  FutureOr<void> _onPick(ImagePickerEventOnPick event, Emitter<ImagePickerState> emit) async {
    final ImagePicker picker = ImagePicker();
    emit(const ImagePickerLoading());
    await picker.pickImage(source: ImageSource.gallery)
    .then((value) async {
      if(value != null) {
        emit(ImagePickerStatePicked(image: value));
      }
    });
  }

  FutureOr<void> _onReset(ImagePickerEventReset event, Emitter<ImagePickerState> emit) {
    emit(const ImagePickerInitial());
  }
}
