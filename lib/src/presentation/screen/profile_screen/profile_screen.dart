import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/bloc/theme_bloc/theme_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/screen/home_screen/widget/stl/header_bar.dart';
import 'package:pvs/src/presentation/screen/user_screen/common/auth_input.dart';
import 'package:pvs/src/service/app_router.dart';

import '../../../bloc/data_bloc/data_bloc.dart';
import '../../../constant/app_path.dart';
import 'bloc/image_picker_bloc/image_picker_bloc.dart';
import 'bloc/profile_bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return BlocBuilder<DataBloc, DataState>(
              builder: (context, dataState) {
                return BlocBuilder<ImagePickerBloc, ImagePickerState>(
                  builder: (context, imagePickerState) {
                    return Scaffold(
                      backgroundColor: AppThemes.theme.backgroundColor,
                      body: Stack(
                        children: [
                          SizedBox(
                            height: size.height * 0.25,
                            child: Image.asset(AppPath.a2Background,
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: size.height * 0.14,
                                    width: double.maxFinite),
                                SizedBox(
                                  height: size.height * 0.22,
                                  width: size.height * 0.22,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Container(
                                      color: AppThemes.theme.backgroundColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: GestureDetector(
                                          onTap: profileState.canEdit
                                              ? () {
                                                  BlocProvider.of<
                                                              ImagePickerBloc>(
                                                          context)
                                                      .add(
                                                          ImagePickerEventOnPick());
                                                }
                                              : () {},
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            child: (imagePickerState
                                                    is ImagePickerStatePicked
                                                ? Image.file(
                                                    File(imagePickerState
                                                        .image.path),
                                                    fit: BoxFit.cover)
                                                : Image.asset(
                                                    AppPath.defaultAvatar,
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(dataState.user.displayName ?? 'Null',
                                    style: AppThemes
                                        .theme.profileDisplayNameStyle),
                                const SizedBox(height: 4.0),
                                Text(dataState.user.id ?? 'Null',
                                    style: AppThemes.theme.profileIdStyle),
                                const SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(
                                        height: 30.0,
                                        width: 40.0,
                                        color: Colors.greenAccent,
                                        child: Center(
                                            child: Text(dataState.user.currentLesson.toString(),
                                                style: AppThemes
                                                    .theme.countProcessStyle)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                          child: SizedBox(
                                              height: size.height * 0.01,
                                              width: 0.1)),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(
                                        height: 30.0,
                                        width: 40.0,
                                        color: Colors.redAccent,
                                        child: Center(
                                            child: Text(dataState.user.totalLesson.toString(),
                                                style: AppThemes
                                                    .theme.countProcessStyle)),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        AuthInput(
                                          icon: Icons.email,
                                          label: dataState.user.email ?? 'Null',
                                          borderRadius: 5.0,
                                          enable: profileState.canEdit,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        const SizedBox(height: 16.0),
                                        AuthInput(
                                          icon: Icons.phone,
                                          label: dataState.user.phoneNumber ?? 'Null',
                                          borderRadius: 5.0,
                                          enable: profileState.canEdit,
                                          keyboardType: TextInputType.phone,
                                        ),
                                        const SizedBox(height: 16.0),
                                        AuthInput(
                                          icon: Icons.group,
                                          label: dataState.user.groupClass.toString(),
                                          borderRadius: 5.0,
                                          enable: profileState.canEdit,
                                          keyboardType: TextInputType.number,
                                        ),
                                        const SizedBox(height: 16.0),
                                        Switch(
                                            value: AppThemes.darkMode,
                                            activeColor:
                                                AppThemes.theme.primaryColor,
                                            onChanged: (_) {
                                              BlocProvider.of<ThemeBloc>(
                                                      context)
                                                  .add(ThemeEventChangeTheme(
                                                      darkMode: _));
                                            })
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          HeaderBar(
                            backgroundColor: Colors.transparent,
                            height: size.height * 0.09,
                            leading: Icon(Icons.arrow_back_rounded,
                                color: AppThemes.theme.backgroundColor),
                            leadingOnPress: () {
                              AppRouter.navigatorKey.currentState?.pop();
                            },
                          )
                        ],
                      ),
                      floatingActionButton: FloatingActionButton(
                        backgroundColor: AppThemes.theme.primaryColor,
                        onPressed: () {
                          BlocProvider.of<ProfileBloc>(context).add(
                              ProfileEventChangeState(
                                  canEdit: !(profileState.canEdit)));
                        },
                        child: Icon(
                            profileState.canEdit ? Icons.done : Icons.edit),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
