import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/constant/app_path.dart';
import 'package:pvs/src/presentation/screen/profile_screen/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:pvs/src/presentation/screen/profile_screen/bloc/profile_bloc/profile_bloc.dart';
import 'package:pvs/src/presentation/screen/user_screen/bloc/user_bloc/user_bloc.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    this.height,
    this.isRegistry
  }) : super(key: key);
  final double? height;
  final bool? isRegistry;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        return BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, imagePickerState) {
            return BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                return SizedBox(
                  height: height ?? size.height * 0.22,
                  width: height ?? size.height * 0.22,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      color: AppThemes.theme.backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: (profileState.canEdit || (isRegistry ?? false))
                              ? () {
                                  BlocProvider.of<ImagePickerBloc>(context).add(
                                      ImagePickerEventOnPick(
                                          id: (userState
                                                  is UserStateLoginSuccessful
                                              ? userState.account.id!
                                              : (userState
                                                      is UserStateRegistryFail
                                                  ? userState.id
                                                  : ''))));
                                }
                              : () {},
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
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
