import 'dart:async';
import 'dart:math';

/// A class to create artificial delays given a [minDelay] and [maxDelay].
class ArtificialDelay {
  /// Create a new [ArtificialDelay] with the delay range being between
  /// [minDelay] and [maxDelay].
  ArtificialDelay(
    this.minDelay,
    this.maxDelay,
  ) {
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

  /// The minimum amount of time we might wait.
  final Duration minDelay;

  /// The maximum amount of time we might wait.
  final Duration maxDelay;

  final _random = Random();

  /// Generate a random integer from [min] to [max].
  int _getRandomInRange(int min, int max) => min + _random.nextInt(max - min);

  /// Trigger a randomized delay.
  Future<int> trigger() async {
    final minMillis = minDelay.inMilliseconds;
    final maxMillis = maxDelay.inMilliseconds;
    final randomMillis = _getRandomInRange(minMillis, maxMillis);

    await Future<void>.delayed(Duration(milliseconds: randomMillis));
    return randomMillis;
  }
}
