import 'package:flutter/material.dart';

class RankPage extends StatelessWidget {
  const RankPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Bảng Xếp Hạng', style: TextStyle(color: Colors.white)),
        const SizedBox(height: 16.0),
        Table(
          children: const [
            TableRow(
                children: [
                  Center(child: Text('Thứ hạng', style: TextStyle(color: Colors.white))),
                  Center(child: Text('Tên', style: TextStyle(color: Colors.white))),
                  Center(child: Text('Điểm số', style: TextStyle(color: Colors.white)))
                ]
            ),
            TableRow(
                children: [
                  Center(child: Text('1', style: TextStyle(color: Colors.white))),
                  Center(child: Text('Cao Viêt Đức', style: TextStyle(color: Colors.white))),
                  Center(child: Text('84545', style: TextStyle(color: Colors.white)))
                ]
            ),
            TableRow(
                children: [
                  Center(child: Text('2', style: TextStyle(color: Colors.white))),
                  Center(child: Text('Cao Viêt Đức', style: TextStyle(color: Colors.white))),
                  Center(child: Text('78945', style: TextStyle(color: Colors.white)))
                ]
            ),
            TableRow(
                children: [
                  Center(child: Text('3', style: TextStyle(color: Colors.white))),
                  Center(child: Text('Cao Viêt Đức', style: TextStyle(color: Colors.white))),
                  Center(child: Text('52345', style: TextStyle(color: Colors.white)))
                ]
            ),
            TableRow(
                children: [
                  Center(child: Text('4', style: TextStyle(color: Colors.white))),
                  Center(child: Text('Cao Viêt Đức', style: TextStyle(color: Colors.white))),
                  Center(child: Text('10557', style: TextStyle(color: Colors.white)))
                ]
            ),
            TableRow(
                children: [
                  Center(child: Text('5', style: TextStyle(color: Colors.white))),
                  Center(child: Text('Cao Viêt Đức', style: TextStyle(color: Colors.white))),
                  Center(child: Text('456', style: TextStyle(color: Colors.white)))
                ]
            ),
            TableRow(
                children: [
                  Center(child: Text('6', style: TextStyle(color: Colors.white))),
                  Center(child: Text('Cao Viêt Đức', style: TextStyle(color: Colors.white))),
                  Center(child: Text('0', style: TextStyle(color: Colors.white)))
                ]
            ),
            TableRow(
                children: [
                  Center(child: Text("---", style: TextStyle(color: Colors.white))),
                  Center(child: Text("---", style: TextStyle(color: Colors.white))),
                  Center(child: Text("---", style: TextStyle(color: Colors.white))),
                ]
            ),
            TableRow(
                children: [
                  Center(child: Text('28', style: TextStyle(color: Colors.white))),
                  Center(child: Text('Cao Viêt Đức', style: TextStyle(color: Colors.white))),
                  Center(child: Text('98456', style: TextStyle(color: Colors.white)))
                ]
            ),
          ],
        )
      ],
    );
  }
}