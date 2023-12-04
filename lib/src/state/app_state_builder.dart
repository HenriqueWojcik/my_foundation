import 'package:flutter/material.dart';

import '../widgets/app_progress_indicator.dart';
import 'app_state.dart';

class AppStateBuilder<T> extends StatelessWidget {
  final Widget Function(BuildContext context, AppState<T> state) builder;
  final AppState<T> state;

  const AppStateBuilder({
    super.key,
    required this.state,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: state,
      builder: (context, _) {
        if (state.loading) {
          return const AppProgressIndicator();
        }

        return builder(context, state);
      },
    );
  }
}
