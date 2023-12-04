import 'package:flutter/material.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check_circle_outline,
      color: Colors.green[700],
      size: 30,
    );
  }
}
