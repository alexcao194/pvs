import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 350,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: const Center(child: Text('Điền từ còn thiếu vào chỗ trống')),
    );
  }
}