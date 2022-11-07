import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/bloc/data_bloc/data_bloc.dart';

import '../../../../../constant/app_path.dart';
import '../../../../../service/local_authentication.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, dataState) {
        return Stack(
          children: [
            SizedBox(
                height: size.height * 0.25,
                child: Image.asset(AppPath.a2Background, fit: BoxFit.cover)),
            SizedBox(
                height: size.height * 0.25,
                child: Image.asset(AppPath.filter, fit: BoxFit.cover)),
            SafeArea(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        height: size.height * 0.13,
                        width: size.height * 0.13,
                        color: AppThemes.theme.buttonBackgroundColor,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: getAvatar(dataState)
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text('Cao Việt Đức',
                        style: AppThemes.theme.displayNameStyle),
                    const SizedBox(height: 4.0),
                    Text('B21DCCN235', style: AppThemes.theme.idStudentStyle)
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  Widget getAvatar(DataState dataState) {
    if(dataState.user.avatar == 'undefined') {
      return Image.asset(AppPath.defaultAvatar, fit: BoxFit.cover);
    } else {
      return Image.network(LocalAuthentication.avatar(dataState.user.id!), fit: BoxFit.cover);
    }
  }
}
