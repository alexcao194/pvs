import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/screen/user_screen/common/auth_input.dart';
import 'package:pvs/src/service/app_time.dart';

import '../../../config/theme.dart';
import '../../common/widget/stl/avatar.dart';
import '../profile_screen/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'bloc/date_picker_bloc/date_picker_bloc.dart';
import 'bloc/drop_menu_bloc/drop_menu_bloc.dart';
import 'bloc/user_bloc/user_bloc.dart';

class RegistryScreen extends StatelessWidget {
  RegistryScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController groupController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, imagePickerState) {
            return BlocBuilder<DropMenuBloc, DropMenuState>(
              builder: (context, dropMenuState) {
                return BlocBuilder<DatePickerBloc, DatePickerState>(
                  builder: (context, datePickerState) {
                    return Scaffold(
                      body: SafeArea(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Avatar(height: size.height * 0.2, isRegistry: true),
                                SizedBox(
                                    height: size.height * 0.02,
                                    width: double.maxFinite),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: AuthInput(
                                          controller: nameController,
                                          icon: Icons.person,
                                          label: "Họ và tên",
                                          borderRadius: 3.0,
                                        ),
                                      ),
                                      SizedBox(width: size.width * 0.02),
                                      Expanded(
                                        child: AuthInput(
                                          controller: groupController,
                                          icon: Icons.group,
                                          keyboardType: TextInputType.number,
                                          label: "Nhóm",
                                          borderRadius: 3.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: size.height * 0.02,
                                    width: double.maxFinite),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<DatePickerBloc>(
                                                  context)
                                              .add(DatePickerEventOnPick(
                                                  currentTime: DateTime.now(),
                                                  context: context));
                                        },
                                        child: AuthInput(
                                          controller: birthdayController,
                                          icon: Icons.calendar_month,
                                          label: AppTime.simpleDateFormat(
                                              datePickerState.time),
                                          enable: false,
                                          borderRadius: 3.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: size.width * 0.02),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        child: Container(
                                          color: AppThemes
                                              .theme.fillTextInputColor,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            child: DropdownButton(
                                              items: const [
                                                DropdownMenuItem(
                                                    value: 0,
                                                    child: Text('Nam')),
                                                DropdownMenuItem(
                                                    value: 1, child: Text('Nữ'))
                                              ],
                                              value: dropMenuState.value,
                                              onChanged: (value) {
                                                BlocProvider.of<DropMenuBloc>(
                                                        context)
                                                    .add(DropMenuEventChange(
                                                        value: value!));
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                    height: size.height * 0.02,
                                    width: double.maxFinite),
                                AuthInput(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  icon: Icons.phone,
                                  label: "Số điện thoại",
                                  borderRadius: 3.0,
                                ),
                                SizedBox(
                                    height: size.height * 0.02,
                                    width: double.maxFinite),
                                Text(
                                  userState is UserStateRegistryFail
                                      ? userState.error
                                      : (userState
                                              is UserStateRegistrySuccessful
                                          ? userState.status
                                          : ''),
                                  style: AppThemes.theme.userErrorStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      floatingActionButton: FloatingActionButton(
                        backgroundColor: AppThemes.theme.primaryColor,
                        onPressed: () {
                          BlocProvider.of<UserBloc>(context).add(
                              UserEventRegistry(
                                  context: context,
                                  avatar: imagePickerState is ImagePickerStatePicked ? imagePickerState.image : null,
                                  gender: dropMenuState.value.toString(),
                                  group: groupController.value.text,
                                  phoneNumber: phoneController.value.text,
                                  displayName: nameController.value.text,
                                  birthday: AppTime.simpleDateFormat(
                                      datePickerState.time),
                                  id: (userState is UserStateLoginSuccessful
                                      ? userState.account.id!
                                      : (userState is UserStateRegistryFail
                                          ? userState.id
                                          : ''))));
                        },
                        child: const Icon(Icons.check),
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
