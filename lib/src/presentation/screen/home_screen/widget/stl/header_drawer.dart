import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';

import '../../../../../constant/app_path.dart';
class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.25,
            child: Image.asset(AppPath.a2Background, fit: BoxFit.cover)
        ),
        SizedBox(
            height: size.height * 0.25,
            child: Image.asset(AppPath.fillter, fit: BoxFit.cover)
        ),
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
                    child:
                    Image.asset(AppPath.defaultAvatar, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text('Cao Việt Đức',
                    style: AppThemes.theme.displayNameStyle),
                const SizedBox(height: 4.0),
                Text('B21DCCN235',
                    style: AppThemes.theme.idStudentStyle)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
