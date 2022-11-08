import 'package:flutter/material.dart';

class ListQuestion extends StatelessWidget {
  const ListQuestion({
    Key? key,
    this.onTap,
    required this.description,
    required this.result,
    required this.label
  }) : super(key: key);

  final VoidCallback? onTap;
  final String label;
  final String description;
  final String result;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: const Color.fromARGB(255, 240, 240, 240),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0) +
                      const EdgeInsets.symmetric(vertical: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Container(
                      color: Colors.red,
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(label,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      Container(
                          height: 1.0, width: 100.0, color: Colors.white10),
                      Text(description)
                    ]),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(result),
                )
              ],
            ),
          )),
    );
  }
}