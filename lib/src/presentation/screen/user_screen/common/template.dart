import 'package:flutter/material.dart';

import '../../../../constant/app_path.dart';

class Template extends StatelessWidget {
  const Template({Key? key, required this.label, required this.children, this.scrollController}) : super(key: key);

  final ScrollController? scrollController;
  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom == 0
                        ? size.height * 0.25
                        : 0
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Container(
                      height: size.height,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          children: [
                            Text(label),
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
