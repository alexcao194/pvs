import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/screen/home_screen/bloc/navigaton_bar_bloc/navigation_bar_bloc.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../constant/app_path.dart';
import '../profile_screen/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'widget/stl/app_drawer.dart';
import 'widget/stl/app_video_player.dart';
import 'widget/stl/header_bar.dart';
import 'widget/stl/navigation_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
        builder: (context, navigationBarState) {
      return BlocBuilder<ImagePickerBloc, ImagePickerState>(
  builder: (context, imagePickerState) {
    return Scaffold(
        backgroundColor: AppThemes.theme.backgroundColor,
        key: _scaffoldKey,
        drawer: const AppDrawer(),
        body: Column(
          children: [
            HeaderBar(
              height: size.height * 0.1,
              title: 'Hello World',
              leading: CircleAvatar(
                radius: 20.0,
                backgroundColor: AppThemes.theme.buttonBackgroundColor,
                child: Text(
                  '1',
                  style: AppThemes.theme.lessonButtonStyle,
                ),
              ),
              action: ClipRRect(
                borderRadius:
                BorderRadius.circular(100.0),
                child: (imagePickerState is ImagePickerStatePicked
                    ? Image.file(File(imagePickerState.image.path), fit: BoxFit.cover)
                    : Image.asset(
                    AppPath.defaultAvatar,
                    fit: BoxFit.cover)),
              ),
              leadingOnPress: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              actionOnPress: () {
                AppRouter.navigatorKey.currentState?.pushNamed(AppRoutes.profile);
              },
            ),
            SizedBox(
              height: size.height * 0.81,
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  print('111111');
                  BlocProvider.of<NavigationBarBloc>(context).add(NavigationBarEventChangePage(pickedPage: index));
                },
                children: const [
                  Center(child: Text('comming soon1')),
                  Center(child: Text('comming soon2')),
                  Center(child: Text('comming soon3')),
                  Center(child: Text('comming soon4')),
                  Center(child: Text('comming soon5'))
                ],
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
            ? FloatingActionButton(
                backgroundColor: AppThemes.theme.primaryColor,
                onPressed: () {
                  BlocProvider.of<NavigationBarBloc>(context).add(
                      NavigationBarEventChangePage(
                          pickedPage: 2, controller: pageController));
                },
                child: const Icon(Icons.home),
              )
            : null,
        bottomNavigationBar: NavigationAppBar(pageController: pageController, size: size),
      );
  },
);
    });
  }
}
