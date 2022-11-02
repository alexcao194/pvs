import 'package:flutter/material.dart';

class BlankBox extends StatelessWidget {
  const BlankBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: 60,
        height: 40,
        child: TextField(
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
