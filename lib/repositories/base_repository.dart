import '../src/data/error/error_handler.dart';
import '../src/entities/failure.dart';
import '../src/print/debug_print.dart';

typedef Task<T> = Future<T> Function();

abstract class BaseRepository<EH extends ErrorHandler> {
  final EH? errorHandler;

  BaseRepository({this.errorHandler});

  Future<(Failure?, T?)> doAsync<T>(
    Task<T> task,
  ) async {
    try {
      final value = await task();

      return (null, value);
    } on Exception catch (e, stack) {
      debugPrint('>>>>>>>>> Exception $e');
      debugPrint('>>>>>>>>> StackTrace $stack');

      final Failure? error = errorHandler?.handleError(e);

      if (error != null) {
        return (error, null);
      }

      return (Failure(message: e.toString(), title: 'Error'), null);
    }
  }
}
