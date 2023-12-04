import 'package:flutter_test/flutter_test.dart';
import 'package:my_foundation/main.dart';

class BaseRepositoryTest extends BaseRepository {}

void main() {
  late BaseRepositoryTest sut;

  setUp(() {
    sut = BaseRepositoryTest();
  });

  test('return right when is success on the task', () async {
    final (Failure? failure, int? data) = await sut.doAsync<int>(() async => 1);

    expect(data, 1);
    expect(failure, null);
  });

  test(
    'return left when has erros on the task',
    () async {
      final Exception exception = Exception('Error');

      final (Failure? failure, int? data) =
          await sut.doAsync<int>(() async => throw exception);

      expect(data, null);
      expect(failure?.message, exception.toString());
    },
  );
}
