import '../data/error/error_handler.dart';
import '../entities/failure.dart';
import '../execution/execution_politcy.dart';
import '../logging/logger.dart';

typedef Task<T> = Future<T> Function();

abstract class BaseRepository<EH extends ErrorHandler> {
  final EH? errorHandler;

  BaseRepository({this.errorHandler});

  Future<(Failure?, T?)> doAsync<T>(
    Task<T> task, {
    String? label,
    List<ExecutionPolicy>? policies,
  }) async {
    final operation = label ?? 'async operation';

    try {
      var value = await task();

      logEvent('[$operation] Sucesso');
      if (policies != null) {
        // for (final policy in policies) {
        //   final current = value;
        //   value = await policy.execute(current);
        // }
      }

      return (null, value);
    } on Exception catch (e, stack) {
      logEvent('[$operation] Erro: $e', error: e.toString(), stackTrace: stack);

      final Failure? error = errorHandler?.handleError(e);

      if (error != null) {
        return (error, null);
      }

      return (Failure(message: e.toString(), title: 'Error'), null);
    }
  }
}
