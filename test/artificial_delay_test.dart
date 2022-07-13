import 'package:artificial_delay/artificial_delay.dart';
import 'package:test/test.dart';

void main() {
  test('Random delay and return', () async {
    final minMs = 100;
    final maxMs = 1000;

    final artificialDelay = ArtificialDelay(
        minDelay: Duration(milliseconds: minMs),
        maxDelay: Duration(milliseconds: maxMs),
    );

    final delayMs = await artificialDelay.trigger();

    expect(delayMs, greaterThanOrEqualTo(minMs));
    expect(delayMs, lessThanOrEqualTo(maxMs));
  });
}