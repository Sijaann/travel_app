import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  //Text Properties
  double size;
  final String text;
  final Color color;

  AppText(
      {Key? key,
      this.size = 16.0,
      required this.text,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
