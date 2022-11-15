import 'dart:io';

import 'package:flutter/material.dart';
import 'package:alex_core/alex_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pvs/src/constant/app_path.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/app_time.dart';
import 'package:pvs/src/service/image_picker.dart';
import 'package:pvs/src/service/local_authentication.dart';
import 'package:pvs/src/service/shared_preferences.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({Key? key}) : super(key: key);

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {

  XFile? img;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            const Text('Điểm danh', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: size.height * 0.5,
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: img == null
                      ? Image.asset(AppPath.defaultAvatar, fit: BoxFit.cover)
                      : Image.file(File(img!.path)),
                )
              ),
            ),
            InkWellButton(
              height: 70,
              width: 70,
              borderWidth: 2.0,
              onTap: () async {
                ImgPicker.onPick(ImageSource.camera).then((value) {
                  setState(() {
                    img = value;
                  });
                });
              },
              primaryColor: Colors.red,
              child: const Icon(Icons.camera_alt_outlined, size: 32, color: Colors.grey,),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWellButton(
                  height: 50,
                  width: 120,
                  radius: 10.0,
                  onTap: () {
                    AppRouter.navigatorKey.currentState?.pop();
                  },
                  primaryColor: Colors.red,
                  child: const Text('Hủy'),
                ),
                SizedBox(width: size.width * 0.1),
                InkWellButton(
                  height: 50,
                  width: 120,
                  radius: 10.0,
                  onTap: img != null
                    ? () async {
                    await LocalAuthentication.checkin('/checkin', File(img!.path).path, '${AppTime.simpleDateFormat(DateTime.now()).replaceAll('/', '-')}/${Prefs.get('id')}.jpg', {});
                    AppRouter.navigatorKey.currentState?.pop();
                  }
                  : null,
                  primaryColor: img == null ? Colors.grey :  Colors.red,
                  child: const Text('Điểm danh'),
                )
              ],
            ),
            const SizedBox(height: 50.0)
          ],
        ),
      ),
    );
  }
}
