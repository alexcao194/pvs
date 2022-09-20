import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';

import 'header_drawer.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: AppThemes.theme.backgroundColor,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.25),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerEnableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerEnableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerEnableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerEnableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerEnableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerEnableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerEnableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerEnableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerEnableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerEnableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerEnableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerDisableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerDisableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerDisableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerDisableStyle)),
                ListTile(title: Text('Tiêu đề ne', style: AppThemes.theme.titleDrawerDisableStyle)),
              ],
            ),
          ),
          const HeaderDrawer()
        ],
      ),
    );
  }
}

