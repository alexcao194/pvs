import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({
    Key? key, required this.title, required this.description, required this.iconData,
  }) : super(key: key);

  final String title;
  final String description;
  final IconData iconData;

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.4,
      width: size.width * 0.42,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black45,
                      width: 1,
                    )
                  ),
                    child: Icon(widget.iconData, size: size.width * 0.10)
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: FlutterSwitch(
                    switchBorder: Border.all(
                      width: 1,
                      color: Colors.black45
                    ),
                      padding: 2.0,
                      width: size.width * 0.13,
                      height: size.height * 0.035,
                      activeColor: Colors.white,

                      inactiveColor: Colors.white,
                      activeToggleColor: Colors.black26,
                      inactiveToggleColor: Colors.black26,
                      value: isActive,
                      onToggle: (bool value) {
                        setState(() {
                          isActive = !isActive;
                        });
                      }
                  ),
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            Text(widget.title, style: TextStyle(fontSize: size.width * 0.045)),
            const SizedBox(height: 8.0),
            Text(widget.description, style: TextStyle(fontSize: size.width * 0.035, color: Colors.black26))
          ],
        ),
      ),
    );
  }
}