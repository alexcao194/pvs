import 'package:flutter/material.dart';
import 'package:pvs/src/config/theme.dart';

import '../../../../constant/app_path.dart';

class Template extends StatelessWidget {
  const Template({Key? key, required this.label, required this.children, this.scrollController, this.height}) : super(key: key);

  final ScrollController? scrollController;
  final String label;
  final List<Widget> children;
  final double? height;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppThemes.theme.backgroundColor,
        body: Stack(
          children: [
            SizedBox(
              height: size.height * 0.3,
              child: Image.asset(AppPath.a2Background, fit: BoxFit.cover),
            ),
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  AnimatedSize(
                    duration: const Duration(milliseconds: 100),
                    child: SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom == 0
                          ? size.height * 0.25
                          : 0
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      height: height ?? size.height,
                      color: AppThemes.theme.backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          children: [
                            Text(label, style: AppThemes.theme.titleUserScreenStyle),
                            SizedBox(height: size.height * 0.03),
                          ] + children,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
