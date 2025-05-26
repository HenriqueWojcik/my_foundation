abstract class ExecutionPolicy {
  Future<T> execute<T>(Future<T> Function() task);
}
