import 'package:flutter/material.dart';

import '../app_progress_indicator.dart';

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
      width: 25,
      child: AppProgressIndicator(),
    );
  }
}
