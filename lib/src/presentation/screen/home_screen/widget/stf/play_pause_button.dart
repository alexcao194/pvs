import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/bloc/navigaton_bar_bloc/navigation_bar_bloc.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        value: 1.0,
        vsync: this,
        duration: const Duration(milliseconds: 300)
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<NavigationBarBloc>(context)
                .add(NavigationBarEventChangePage(
                pickedPage: 2,
                controller: widget.pageController));
          },
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: controller,
          ),
        );
      },
    );
  }
}
