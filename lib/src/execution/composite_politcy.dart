import 'execution_politcy.dart';

class CompositePolicy implements ExecutionPolicy {
  final List<ExecutionPolicy> policies;

  CompositePolicy(this.policies);

  @override
  Future<T> execute<T>(Future<T> Function() task) {
    Future<T> Function() composed = task;
    for (final policy in policies) {
      final current = composed;
      composed = () => policy.execute(() => current());
    }
    return composed();
  }
}
