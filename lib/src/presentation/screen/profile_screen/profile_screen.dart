import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/bloc/data_bloc/data_bloc.dart';
import 'package:pvs/src/presentation/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:pvs/src/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/widget/stl/header_bar.dart';
import 'package:pvs/src/presentation/screen/user_screen/bloc/date_picker_bloc/date_picker_bloc.dart';
import 'package:pvs/src/presentation/screen/user_screen/bloc/drop_menu_bloc/drop_menu_bloc.dart';
import 'package:pvs/src/presentation/screen/user_screen/bloc/user_bloc/user_bloc.dart';
import 'package:pvs/src/presentation/screen/user_screen/widget/stl/auth_input.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/app_time.dart';

import '../../../constant/app_path.dart';
import 'bloc/profile_bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final TextEditingController birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return BlocBuilder<DataBloc, DataState>(
              builder: (context, dataState) {
                return BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    return BlocBuilder<ImagePickerBloc, ImagePickerState>(
                      builder: (context, imagePickerState) {
                        return BlocBuilder<DatePickerBloc, DatePickerState>(
                          builder: (context, datePickerState) {
                            return BlocBuilder<DropMenuBloc, DropMenuState>(
                              builder: (context, dropMenuState) {
                                return Scaffold(
                                  backgroundColor: AppThemes.theme
                                      .backgroundColor,
                                  body: Stack(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.25,
                                        child: Image.asset(AppPath.a2Background,
                                            fit: BoxFit.cover),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [
                                            SizedBox(
                                                height: size.height * 0.14,
                                                width: double.maxFinite),
                                            SizedBox(
                                              height: size.height * 0.22,
                                              width: size.height * 0.22,
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(100.0),
                                                child: Container(
                                                  color:
                                                  AppThemes.theme
                                                      .backgroundColor,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(
                                                        4.0),
                                                    child: GestureDetector(
                                                      onTap: profileState
                                                          .canEdit
                                                          ? () {
                                                        BlocProvider.of<
                                                            ImagePickerBloc>(
                                                            context)
                                                            .add(
                                                            ImagePickerEventOnPick(
                                                                id: (userState is UserStateLoginSuccessful
                                                                    ? userState
                                                                    .account
                                                                    .id!
                                                                    : (userState
                                                                is UserStateRegistryFail
                                                                    ? userState
                                                                    .id
                                                                    : ''))));
                                                      }
                                                          : () {},
                                                      child: ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                          child: (dataState.user
                                                              .avatar!.length >
                                                              4)
                                                              ? Image.network(
                                                            dataState
                                                                .user.avatar!,
                                                            fit: BoxFit.cover,
                                                          )
                                                              : Image.asset(
                                                              AppPath
                                                                  .defaultAvatar,
                                                              fit: BoxFit
                                                                  .cover)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(dataState.user.displayName ??
                                                'Null',
                                                style: AppThemes
                                                    .theme
                                                    .profileDisplayNameStyle),
                                            const SizedBox(height: 4.0),
                                            Text(dataState.user.id ?? 'Null',
                                                style: AppThemes.theme
                                                    .profileIdStyle),
                                            const SizedBox(height: 8.0),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(5.0),
                                                  child: Container(
                                                    height: 30.0,
                                                    width: 40.0,
                                                    color: Colors.greenAccent,
                                                    child: Center(
                                                        child: Text(
                                                            dataState.user
                                                                .currentLesson
                                                                .toString(),
                                                            style: AppThemes
                                                                .theme
                                                                .countProcessStyle)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      8.0),
                                                  child: Card(
                                                      child: SizedBox(
                                                          height: size.height *
                                                              0.01,
                                                          width: 0.1)),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(5.0),
                                                  child: Container(
                                                    height: 30.0,
                                                    width: 40.0,
                                                    color: Colors.redAccent,
                                                    child: Center(
                                                        child: Text(
                                                            dataState.user
                                                                .totalLesson
                                                                .toString(),
                                                            style: AppThemes
                                                                .theme
                                                                .countProcessStyle)),
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
                                                      label: dataState.user
                                                          .email ??
                                                          'Null',
                                                      borderRadius: 5.0,
                                                      enable: profileState
                                                          .canEdit,
                                                      keyboardType:
                                                      TextInputType
                                                          .emailAddress,
                                                    ),
                                                    const SizedBox(
                                                        height: 16.0),
                                                    AuthInput(
                                                      icon: Icons.phone,
                                                      label:
                                                      dataState.user
                                                          .phoneNumber ??
                                                          'Null',
                                                      borderRadius: 5.0,
                                                      enable: profileState
                                                          .canEdit,
                                                      keyboardType: TextInputType
                                                          .phone,
                                                    ),
                                                    const SizedBox(
                                                        height: 16.0),
                                                    AuthInput(
                                                      icon: Icons.group,
                                                      label: dataState.user
                                                          .groupClass
                                                          .toString(),
                                                      borderRadius: 5.0,
                                                      enable: profileState
                                                          .canEdit,
                                                      keyboardType:
                                                      TextInputType.number,
                                                    ),
                                                    const SizedBox(
                                                        height: 16.0),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: GestureDetector(
                                                            onTap: profileState
                                                                .canEdit
                                                                ? () {
                                                              BlocProvider.of<
                                                                  DatePickerBloc>(
                                                                  context)
                                                                  .add(
                                                                  DatePickerEventOnPick(
                                                                      currentTime: DateTime
                                                                          .now(),
                                                                      context: context));
                                                            }
                                                                : () {},
                                                            child: AuthInput(
                                                              controller: birthdayController,
                                                              icon: Icons
                                                                  .calendar_month,
                                                              label: datePickerState is DatePickerStateDone
                                                                  ? AppTime
                                                                  .simpleDateFormat(
                                                                  datePickerState
                                                                      .time)
                                                                  : dataState
                                                                  .user
                                                                  .birthday!,
                                                              enable: false,
                                                              borderRadius: 3.0,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            width: size.width *
                                                                0.02),
                                                        Expanded(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                3.0),
                                                            child: Container(
                                                              color: AppThemes
                                                                  .theme
                                                                  .fillTextInputColor,
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal: 4.0),
                                                                child: DropdownButton(
                                                                  items: const [
                                                                    DropdownMenuItem(
                                                                        value: 0,
                                                                        child: Text(
                                                                            'Nam')),
                                                                    DropdownMenuItem(
                                                                        value: 1,
                                                                        child: Text(
                                                                            'Nữ'))
                                                                  ],
                                                                  value: dropMenuState.value,
                                                                  onChanged: (value) {
                                                                    if (profileState.canEdit) BlocProvider.of<DropMenuBloc>(context).add(DropMenuEventChange(value: value!));
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Switch(
                                                        value: AppThemes
                                                            .darkMode,
                                                        activeColor: AppThemes
                                                            .theme.primaryColor,
                                                        onChanged: (_) {
                                                          BlocProvider.of<
                                                              ThemeBloc>(
                                                              context)
                                                              .add(
                                                              ThemeEventChangeTheme(
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
                                        leading: Icon(Icons.arrow_back_rounded,
                                            color: AppThemes.theme
                                                .backgroundColor),
                                        leadingOnPress: () {
                                          AppRouter.navigatorKey.currentState
                                              ?.pop();
                                        },
                                      )
                                    ],
                                  ),
                                  floatingActionButton: FloatingActionButton(
                                    backgroundColor: AppThemes.theme
                                        .primaryColor,
                                    onPressed: () {
                                      if(profileState.canEdit) {
                                        print('1111');
                                        BlocProvider.of<DatePickerBloc>(context).add(
                                          const DatePickerEventReset()
                                        );
                                      }
                                      BlocProvider.of<ProfileBloc>(context).add(
                                          ProfileEventChangeState(
                                              canEdit: !(profileState
                                                  .canEdit)));
                                    },
                                    child: Icon(
                                        profileState.canEdit
                                            ? Icons.done
                                            : Icons
                                            .edit),
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
              },
            );
          },
        );
      },
    );
  }
}
