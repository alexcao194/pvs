import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/bloc/theme_bloc/theme_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/screen/profile_screen/profile_bloc/profile_bloc.dart';
import 'package:pvs/src/presentation/screen/user_screen/common/auth_input.dart';

import '../../../constant/app_path.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.asset(AppPath.defaultAvatar,
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text('Cao Việt Đức',
                            style: AppThemes.theme.profileDisplayNameStyle),
                        const SizedBox(height: 4.0),
                        Text('B21DCCN235',
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
                                    child: Text('12',
                                        style:
                                            AppThemes.theme.countProcessStyle)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                  child: SizedBox(
                                      height: size.height * 0.01, width: 0.1)),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                height: 30.0,
                                width: 40.0,
                                color: Colors.redAccent,
                                child: Center(
                                    child: Text('24',
                                        style:
                                            AppThemes.theme.countProcessStyle)),
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
                                  label: 'alexcao194@gmail.com',
                                  borderRadius: 5.0,
                                  enable: profileState.canEdit,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 16.0),
                                AuthInput(
                                  icon: Icons.phone,
                                  label: '0339143776',
                                  borderRadius: 5.0,
                                  enable: profileState.canEdit,
                                  keyboardType: TextInputType.phone,
                                ),
                                const SizedBox(height: 16.0),
                                AuthInput(
                                  icon: Icons.group,
                                  label: '07',
                                  borderRadius: 5.0,
                                  enable: profileState.canEdit,
                                  keyboardType: TextInputType.number,
                                ),
                                const SizedBox(height: 16.0),
                                Switch(
                                    value: AppThemes.darkMode,
                                    activeColor: AppThemes.theme.primaryColor,
                                    onChanged: (_) {
                                      BlocProvider.of<ThemeBloc>(context).add(
                                          ThemeEventChangeTheme(darkMode: _));
                                    })
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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
                child: Icon(profileState.canEdit ? Icons.done : Icons.edit),
              ),
            );
          },
        );
      },
    );
  }
}
