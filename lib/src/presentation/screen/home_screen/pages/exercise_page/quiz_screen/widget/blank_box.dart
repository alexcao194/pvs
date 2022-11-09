import 'package:flutter/material.dart';

class BlankBox extends StatelessWidget {
  const BlankBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: size.height * 0.03,
        width: 60,
        child: const TextField(
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
