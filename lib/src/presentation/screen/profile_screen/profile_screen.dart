import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/bloc/data_bloc/data_bloc.dart';
import 'package:pvs/src/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:pvs/src/presentation/screen/user_screen/bloc/user_bloc/user_bloc.dart';
import 'package:pvs/src/presentation/screen/user_screen/widget/stl/auth_input.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/app_time.dart';
import 'package:pvs/src/service/date_picker.dart';
import 'package:pvs/src/service/image_picker.dart';
import 'package:pvs/src/service/local_authentication.dart';

import '../../../constant/app_path.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController birthdayController;
  late TextEditingController emailController;
  late TextEditingController numberContrller;
  bool isEditing = false;
  DateTime? date;
  int? gender;
  XFile? img;

  @override
  void dispose() {
    birthdayController.dispose();
    emailController.dispose();
    numberContrller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    birthdayController = TextEditingController();
    emailController = TextEditingController();
    numberContrller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<DataBloc, DataState>(
          builder: (context, dataState) {
            return BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                return Scaffold(
                  backgroundColor: AppThemes.theme.backgroundColor,
                  body: Stack(
                    children: [
                      SizedBox(
                        height: size.height * 0.25,
                        child: Image.asset(AppPath.a2Background, fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: size.height * 0.14, width: double.maxFinite),
                        SizedBox(
                          height: size.height * 0.22,
                          width: size.height * 0.22,
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(100.0),
                            child: Container(
                              color:
                              AppThemes.theme.backgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                    onTap: isEditing
                                        ? () async {
                                      await ImgPicker.onPick().then((value) {
                                        if(value != null) {
                                          setState(() {
                                            img = value;
                                          });
                                        }
                                      });
                                    }
                                        : () {},
                                    child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(100.0),
                                        child: getAvatar(dataState, img)
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                            Text(dataState.user.displayName ?? 'Null', style: AppThemes.theme.profileDisplayNameStyle),
                            const SizedBox(height: 4.0),
                            Text(dataState.user.id ?? 'Null', style: AppThemes.theme.profileIdStyle),
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
                                        child: Text(dataState.user.currentLesson.toString(), style: AppThemes.theme.countProcessStyle)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                      child: SizedBox(height: size.height * 0.01, width: 0.1)),
                                ),
                                ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(5.0),
                                  child: Container(
                                    height: 30.0,
                                    width: 40.0,
                                    color: Colors.redAccent,
                                    child: Center(
                                        child: Text(dataState.user.totalLesson.toString(), style: AppThemes.theme.countProcessStyle)),
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
                                      controller: emailController,
                                      label: dataState.user.email ?? 'Null',
                                      borderRadius: 5.0,
                                      enable: isEditing,
                                      keyboardType:
                                      TextInputType.emailAddress,
                                    ),
                                    const SizedBox(height: 16.0),
                                    AuthInput(
                                      icon: Icons.phone,
                                      controller: numberContrller,
                                      label: dataState.user.phoneNumber ?? 'Null',
                                      borderRadius: 5.0,
                                      enable: isEditing,
                                      keyboardType: TextInputType.phone,
                                    ),
                                    const SizedBox(height: 16.0),
                                    AuthInput(
                                      icon: Icons.group,
                                      label: dataState.user.groupClass.toString(),
                                      borderRadius: 5.0,
                                      enable: false,
                                      keyboardType:
                                      TextInputType.number,
                                    ),
                                    const SizedBox(height: 16.0),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: isEditing
                                                ? () async {
                                              await DatePicker.onPick(context, 1820, 2300).then((value) {
                                                if(value != null) {
                                                  setState(() {
                                                    date = value;
                                                    birthdayController.text = date != null ? AppTime.simpleDateFormat(date!) : dataState.user.birthday!;
                                                  });
                                                }
                                              });
                                            }
                                                : () {},
                                            child: AuthInput(
                                              controller: birthdayController,
                                              icon: Icons.calendar_month,
                                              label: date != null ? AppTime.simpleDateFormat(date!) : dataState.user.birthday!,
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
                                              color: AppThemes.theme.fillTextInputColor,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                child: DropdownButton(
                                                  underline: const SizedBox(),
                                                  alignment: Alignment.center,
                                                  icon: const SizedBox(),
                                                  items: const [
                                                    DropdownMenuItem(
                                                        value: 0,
                                                        child: Text('Nam')),
                                                    DropdownMenuItem(
                                                        value: 1,
                                                        child: Text('Nữ'))
                                                  ],
                                                  value: gender ?? dataState.user.gender,
                                                  onChanged: (value) {
                                                    if(value != null && isEditing) {
                                                      setState(() {
                                                        gender = value;
                                                      });
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: BackButton(
                          color: Colors.white,
                          onPressed: () {
                            AppRouter.navigatorKey.currentState?.pop();
                          },
                        ),
                      )
                    ],
                  ),
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: AppThemes.theme.primaryColor,
                    onPressed: () {
                      if(isEditing) {
                        BlocProvider.of<UserBloc>(context).add(UserEventUpdateProfile(
                            avatar: img,
                            gender: gender.toString(),
                            birthday: birthdayController.value.text != "" ? birthdayController.value.text : dataState.user.birthday!,
                            phoneNumber: numberContrller.value.text != "" ? numberContrller.value.text : dataState.user.phoneNumber!,
                            email: emailController.value.text != "" ? emailController.value.text : dataState.user.email!,
                            context: context));
                      } else {
                        setState(() {
                          numberContrller.text = dataState.user.phoneNumber!;
                          emailController.text = dataState.user.email!;
                        });
                      }
                      setState(() {
                        isEditing = !isEditing;
                      });
                    },
                    child: Icon(isEditing ? Icons.done : Icons.edit),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget getAvatar(dataState, img) {
    if(isEditing) {
      if(img != null) {
        return Image.file(File(img.path), fit: BoxFit.cover);
      } else {
        return (dataState.user.avatar! != 'undefined')
            ? Image.network(LocalAuthentication.avatar(dataState.user.id!), fit: BoxFit.cover,)
            : Image.asset(AppPath.defaultAvatar, fit: BoxFit.cover);
      }
    } else {
      return (dataState.user.avatar! != 'undefined')
          ? Image.network(LocalAuthentication.avatar(dataState.user.id!), fit: BoxFit.cover)
          : Image.asset(AppPath.defaultAvatar, fit: BoxFit.cover);
    }
  }
}
