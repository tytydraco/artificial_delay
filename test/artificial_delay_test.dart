import 'package:artificial_delay/artificial_delay.dart';
import 'package:test/test.dart';

void main() {
  test('Random delay and return', () async {
    const minMs = 100;
    const maxMs = 1000;

    final artificialDelay = ArtificialDelay(
      const Duration(milliseconds: minMs),
      const Duration(milliseconds: maxMs),
    );

    final delayMs = await artificialDelay.trigger();

    expect(delayMs, greaterThanOrEqualTo(minMs));
    expect(delayMs, lessThanOrEqualTo(maxMs));
  });
}
