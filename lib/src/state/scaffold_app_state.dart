import 'app_state.dart';

class ScaffoldAppState<T> extends AppState<T> {
  String onSuccessMessage;
  String get onErrorMessage => error?.toString() ?? '';
  final String? onLoadingMessage;

  ScaffoldAppState({
    required this.onSuccessMessage,
    this.onLoadingMessage,
  });
}
