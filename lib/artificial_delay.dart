import 'dart:async';
import 'dart:math';

/// A class to create artificial delays given a [minDelay] and [maxDelay].
class ArtificialDelay {
  /// The minimum amount of time we might wait.
  final Duration minDelay;

  /// The maximum amount of time we might wait.
  final Duration maxDelay;

  final _random = Random();

  ArtificialDelay({
    required this.minDelay,
    required this.maxDelay,
  }) {
    if (minDelay > maxDelay) {
      throw ArgumentError('minDelay must be less than or equal to maxDelay');
    }

    if (minDelay.isNegative) {
      throw ArgumentError('Must be a positive duration', 'minDelay');
    }

    if (maxDelay.isNegative) {
      throw ArgumentError('Must be a positive duration', 'maxDelay');
    }
  }

  /// Generate a random integer from [min] to [max], inclusive.
  int _getRandomInRange(int min, int max) =>
      min + _random.nextInt(max + 1 - min);

  /// Trigger a randomized delay.
  Future<int> trigger() async {
    final minMillis = minDelay.inMilliseconds;
    final maxMillis = maxDelay.inMilliseconds;
    final randomMillis = _getRandomInRange(minMillis, maxMillis);

    await Future.delayed(Duration(milliseconds: randomMillis));
    return randomMillis;
  }
}
