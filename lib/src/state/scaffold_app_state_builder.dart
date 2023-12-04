import 'package:flutter/material.dart';

import '../widgets/snack_bar/error_icon.dart';
import '../widgets/snack_bar/loading_icon.dart';
import '../widgets/snack_bar/success_icon.dart';
import 'scaffold_app_state.dart';

class ScaffoldAppStateBuilder<T> extends StatefulWidget {
  final ScaffoldAppState state;
  final Function onSuccess;
  final Function? onError;

  final Widget body;
  final PreferredSizeWidget? appBar;

  const ScaffoldAppStateBuilder({
    Key? key,
    required this.state,
    required this.onSuccess,
    this.onError,
    required this.body,
    this.appBar,
  }) : super(key: key);

  @override
  State<ScaffoldAppStateBuilder> createState() =>
      _ScaffoldAppStateBuilderState();
}

class _ScaffoldAppStateBuilderState extends State<ScaffoldAppStateBuilder> {
  ScaffoldAppState get state => widget.state;

  @override
  void initState() {
    super.initState();

    state.addListener(() {
      if (state.loading) {
        onLoading();
        return;
      }

      if (state.hasData) {
        onSuccess();
        return;
      }

      if (state.hasError) {
        onError();
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
      key: widget.key,
    );
  }

  void onLoading() {
    showSnackBar(message: 'Loading', icon: const LoadingIcon());
  }

  Future<void> onSuccess() async {
    if (mounted) {
      closeSnackBar();

      showSnackBar(message: state.onSuccessMessage, icon: const SuccessIcon());
      await Future.delayed(const Duration(seconds: 1));

      widget.onSuccess();

      closeSnackBar();
    }
  }

  void onError() async {
    if (mounted) {
      closeSnackBar();

      showSnackBar(message: state.error.toString(), icon: const ErrorIcon());

      await Future.delayed(const Duration(seconds: 3));
      closeSnackBar();
    }
  }

  void showSnackBar({required String message, Widget? icon}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(8),
        duration: const Duration(minutes: 1),
        content: Row(
          children: [
            if (icon != null) ...[
              icon,
              const SizedBox(width: 10),
            ],
            Text(message),
          ],
        ),
      ),
    );
  }

  void closeSnackBar() {
    if (mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
  }
}
