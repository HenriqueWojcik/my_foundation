import 'execution_politcy.dart';

class RetryPolicy implements ExecutionPolicy {
  final int retries;
  final Duration delay;

  RetryPolicy({this.retries = 3, this.delay = const Duration(seconds: 1)});

  @override
  Future<T> execute<T>(Future<T> Function() task) async {
    int attempt = 0;

    while (true) {
      try {
        return await task();
      } catch (e) {
        attempt++;
        if (attempt > retries) rethrow;
        await Future.delayed(delay);
      }
    }
  }
}
