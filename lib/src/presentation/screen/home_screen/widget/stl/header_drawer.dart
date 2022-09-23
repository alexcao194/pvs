import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';

import '../../../../../constant/app_path.dart';
import '../../../profile_screen/bloc/image_picker_bloc/image_picker_bloc.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<ImagePickerBloc, ImagePickerState>(
      builder: (context, imagePickerState) {
        return Stack(
          children: [
            SizedBox(
                height: size.height * 0.25,
                child: Image.asset(AppPath.a2Background, fit: BoxFit.cover)),
            SizedBox(
                height: size.height * 0.25,
                child: Image.asset(AppPath.filter, fit: BoxFit.cover)),
            SafeArea(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                        height: size.height * 0.13,
                        width: size.height * 0.13,
                        color: AppThemes.theme.buttonBackgroundColor,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: (imagePickerState is ImagePickerStatePicked
                              ? Image.file(File(imagePickerState.image.path),
                                  fit: BoxFit.cover)
                              : Image.asset(AppPath.defaultAvatar,
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text('Cao Việt Đức',
                        style: AppThemes.theme.displayNameStyle),
                    const SizedBox(height: 4.0),
                    Text('B21DCCN235', style: AppThemes.theme.idStudentStyle)
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
