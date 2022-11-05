import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/config/theme.dart';
import 'package:pvs/src/presentation/bloc/data_bloc/data_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/bloc/navigaton_bar_bloc/navigation_bar_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/exercise_page/exercise_page.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/settings_page/settings_page.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/test_page/test_page.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/video_page/video_page.dart';
import 'package:pvs/src/presentation/screen/home_screen/widget/stf/keep_alive_page.dart';
import 'package:pvs/src/service/app_router.dart';
import 'package:pvs/src/service/local_authentication.dart';
import '../../../constant/app_path.dart';
import '../user_screen/bloc/user_bloc/user_bloc.dart';
import 'widget/stl/app_drawer.dart';
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
      return BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          return BlocBuilder<DataBloc, DataState>(
            builder: (context, dataState) {
              return Scaffold(
                  backgroundColor: AppThemes.theme.backgroundColor,
                  key: _scaffoldKey,
                  drawer: const AppDrawer(),
                  body: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: size.height * 0.09),
                        child: PageView(
                          controller: pageController,
                          children: const [
                            TestPage(),
                            VideoPage(),
                            KeepAlivePage(child: ExercisePage()),
                            TestPage(),
                            SettingsPage()
                          ],
                        ),
                      ),
                      buildHeaderBar(dataState),
                    ],
                  ),
                  floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
                  floatingActionButton:
                  (MediaQuery.of(context).viewInsets.bottom == 0 &&
                      navigationBarState.currentPage != 4)
                      ? FloatingActionButton(
                      tooltip: 'Open Quiz',
                      backgroundColor: AppThemes.theme.primaryColor,
                      onPressed: () {
                      },
                      child: const Icon(Icons.quiz))
                      : null,
                  bottomNavigationBar: NavigationAppBar(pageController: pageController, size: size));
            },
          );
        },
      );
    });
  }

  HeaderBar buildHeaderBar(DataState dataState) {
    return HeaderBar(
      headerType: HeaderType.full,
      title: const Text('Hello world', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      leading: CircleAvatar(
        radius: 20.0,
        backgroundColor: AppThemes.theme.buttonBackgroundColor,
        child: const Text(
          '1',
        ),
      ),
      action: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: getAvatar(dataState)),
      leadingOnPress: () {
        _scaffoldKey.currentState?.openDrawer();
      },
      actionOnPress: () {
        AppRouter.navigatorKey.currentState?.pushNamed(AppRoutes.profile);
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
