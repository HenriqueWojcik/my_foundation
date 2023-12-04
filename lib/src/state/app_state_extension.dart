import '../entities/failure.dart';
import '../repositories/base_repository.dart';
import 'app_state.dart';

extension AppStateExtension<T> on AppState {
  Future<void> update(Task<(Failure?, T?)> task) async {
    onLoad();

    final (Failure? failure, T? data) = await task();

    if (failure != null) {
      fail = failure;
      return;
    }

    value = data;
  }
}
