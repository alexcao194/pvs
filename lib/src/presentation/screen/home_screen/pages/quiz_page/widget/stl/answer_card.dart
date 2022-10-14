import 'package:alex_core/alex_core.dart';
import 'package:flutter/material.dart';


class AnswerCard extends StatelessWidget {
  const AnswerCard({Key? key, required this.title, required this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWellButton(
        isActive: true,
        primaryColor: color,
        backgroundColor: Colors.red,
        radius: 8.0,
        onTap: () {},
        child: Text(title, style: const TextStyle(fontSize: 14, color: Colors.white)),
      ),
    );
  }
}
