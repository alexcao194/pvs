import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.count,
    required this.end
  }) : super(key: key);

  final Widget end;
  final int count;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: size.width * 0.1,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white10, width: 3.0),
            borderRadius: BorderRadius.circular(5.0)),
        child: Stack(
          children: [
            Container(
              width: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.9],
                  colors: [
                    Color.fromARGB(255, 255, 171, 23),
                    Color.fromARGB(255, 255, 75, 103),
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    end,
                    const SizedBox(width: 4.0),
                    Text(count.toString(), style: const TextStyle(color: Colors.white))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
