import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pvs/src/presentation/screen/user_screen/widget/stl/auth_input.dart';
import 'package:pvs/src/service/app_time.dart';
import 'package:pvs/src/service/date_picker.dart';

import '../../../config/theme.dart';
import '../../../constant/app_path.dart';
import '../../../service/image_picker.dart';
import 'bloc/user_bloc/user_bloc.dart';

class RegistryScreen extends StatefulWidget {
  const RegistryScreen({Key? key}) : super(key: key);

  @override
  State<RegistryScreen> createState() => _RegistryScreenState();
}

class _RegistryScreenState extends State<RegistryScreen> {
  late TextEditingController nameController;
  late TextEditingController groupController;
  late TextEditingController birthdayController;
  late TextEditingController phoneController;
  XFile? img;
  DateTime? date;
  int gender = 0;

  @override
  void dispose() {
    nameController.dispose();
    groupController.dispose();
    birthdayController.dispose();
    phoneController.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    groupController = TextEditingController();
    birthdayController = TextEditingController();
    phoneController = TextEditingController();
    date = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                    onTap: () async {
                        await ImgPicker.onPick(ImageSource.gallery).then((value) {
                          if (value != null) {
                            setState(() {
                              img = value;
                            });
                          }
                        });
                      },
                      child: SizedBox(
                  height: size.height * 0.22,
                  width: size.height * 0.22,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      color: AppThemes.theme.backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(100.0),
                            child: img == null
                                ? Image.asset(AppPath.defaultAvatar, fit: BoxFit.cover)
                                : Image.file(File(img!.path), fit: BoxFit.cover)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                    buildForm(size),
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
                          : (userState is UserStateRegistrySuccessful
                              ? userState.status
                              : ''),
                      style: TextStyle(
                        color: userState is UserStateRegistryFail
                        ? Colors.red
                          : Colors.green
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppThemes.theme.primaryColor,
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(UserEventRegistry(
                  gender: gender.toString(),
                  group: groupController.value.text.toUpperCase(),
                  phoneNumber: phoneController.value.text,
                  displayName: nameController.value.text,
                  birthday: AppTime.simpleDateFormat(date!),
                  avatar: img,
                  id: (userState is UserStateSignUpSuccessful) ? userState.id : (userState is UserStateRegistryFail ? userState.id : ''),
                  context: context,
              ));
            },
            child: const Icon(Icons.check),
          ),
        );
      },
    );
  }

  Widget buildForm(Size size) {
    return Column(
      children: [
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
          children:  [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  await DatePicker.onPick(context, 1820, 2300).then((value) {
                    setState(() {
                      date = value;
                    });
                  });
                },
                child: AuthInput(
                  controller: birthdayController,
                  icon: Icons.calendar_month,
                  label: AppTime.simpleDateFormat(date!),
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
                      value: gender,
                      onChanged: (value) {
                        setState(() {
                          if(value != null) {
                            gender = value;
                          }
                        });
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

}

