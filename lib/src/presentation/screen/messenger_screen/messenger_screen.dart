import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int a = 10;
    String formula = "a + b == \\(\frac{1}\\)";
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: formula.length * 7,
          child: TeXView(
            child: TeXViewDocument(formula),
            style: const TeXViewStyle(
              backgroundColor: Colors.red
            ),
          ),
        ),
      )
    );
  }
}
