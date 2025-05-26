import 'execution_politcy.dart';

class TimeoutPolicy implements ExecutionPolicy {
  final Duration timeout;

  TimeoutPolicy({required this.timeout});

  @override
  Future<T> execute<T>(Future<T> Function() task) {
    return task().timeout(timeout);
  }
}
