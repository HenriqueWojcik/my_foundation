import 'package:flutter/material.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String message;
  final bool isExpaned;

  const EmptyPlaceholder({
    Key? key,
    required this.message,
    this.isExpaned = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Center(
      child: Text(message),
    );

    return isExpaned ? Expanded(child: child) : child;
  }
}
