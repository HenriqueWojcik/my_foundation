import 'package:flutter/material.dart';

class ErrorIcon extends StatelessWidget {
  const ErrorIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.error_outline,
      color: Colors.red[700],
      size: 30,
    );
  }
}
