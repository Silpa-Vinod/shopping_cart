import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String txt;
  final FontWeight weight;
  final double size;
  final Color color;

  const TextView(
      {super.key,
      required this.txt,
      required this.weight,
      required this.size,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
      ),
    );
  }
}
