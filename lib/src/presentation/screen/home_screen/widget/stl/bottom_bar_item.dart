import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({Key? key, required this.label, required this.isActive, required this.icon}) : super(key: key);

  final bool isActive;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.09,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
              SizedBox(
                height: size.height * 0.04,
                child: Icon(
                  icon,
                  size: 28,
                  color: isActive ? Theme.of(context).primaryColor : Colors.black12,
                )
              ),
            Text(label)
          ],
        ),
      ),
    );
  }
}
