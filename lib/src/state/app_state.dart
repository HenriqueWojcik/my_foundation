import 'package:flutter/foundation.dart';

import '../entities/failure.dart';

class AppState<T> extends ChangeNotifier {
  T? _data;
  Failure? _error;
  bool loading = false;

  AppState();

  T? get data => _data;
  Failure? get error => _error;

  AppState.init(this._data);

  bool get hasData => !hasError && !loading;

  bool get hasError => _error != null;

  bool get isDisposed => !hasListeners;

  set value(T value) {
    _error = null;
    loading = false;
    _data = value;
    notifyListeners();
  }

  set fail(Failure? e) {
    loading = false;
    _data = null;
    _error = e;
    notifyListeners();
  }

  void onLoad() {
    _error = null;
    _data = null;
    loading = true;
    notifyListeners();
  }
}
