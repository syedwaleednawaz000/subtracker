import 'package:flutter/material.dart';

class LinearColorBarWidget extends StatelessWidget {
  final double progress;
  Color? color;

   LinearColorBarWidget({this.color,Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Colors.grey.shade200,
      valueColor:  AlwaysStoppedAnimation<Color>(color!),
    );
  }
}
