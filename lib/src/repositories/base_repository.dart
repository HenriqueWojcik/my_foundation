import '../data/error/error_handler.dart';
import '../entities/failure.dart';
import '../logging/logger.dart';

typedef Task<T> = Future<T> Function();

abstract class BaseRepository<EH extends ErrorHandler> {
  final EH? errorHandler;

  BaseRepository({this.errorHandler});

  Future<(Failure?, T?)> doAsync<T>(
    Task<T> task, {
    String? label,
  }) async {
    final operation = label ?? 'async operation';

    try {
      final value = await task();

      logEvent('[$operation] Sucesso');

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
