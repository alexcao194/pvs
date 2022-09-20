import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';

import '../../../../../../constant/app_path.dart';
class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppThemes.theme.primaryColor,
      height: size.height * 0.25,
      width: double.maxFinite,
      child: SafeArea(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Container(
                height: size.height * 0.13,
                width: size.height * 0.13,
                color: AppThemes.theme.buttonBackgroundColor,
                child:
                Image.asset(AppPath.profile, fit: BoxFit.cover),
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
    );
  }
}
