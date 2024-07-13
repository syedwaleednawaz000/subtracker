
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class LinearColorBar extends StatelessWidget {
  const LinearColorBar({
    super.key,
    required this.lineMaxSteps,
    required this.lineCurrentSteps,
    required this.gradientColors, this.index,
  });

  final List<int> lineMaxSteps;
  final List<int> lineCurrentSteps;
  final List<Color> gradientColors;
  final index;

  @override
  Widget build(BuildContext context) {
    return LinearProgressBar(
      maxSteps: lineMaxSteps[index],
      progressType: LinearProgressBar.progressTypeLinear, // Use Linear progress
      currentStep: lineCurrentSteps[index],
      progressColor: gradientColors[index],
      backgroundColor: Colors.grey,
    );
  }
}