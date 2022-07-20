import 'dart:io';

import 'package:artificial_delay/artificial_delay.dart';

final artificialDelay = ArtificialDelay(
  minDelay: const Duration(milliseconds: 100),
  maxDelay: const Duration(milliseconds: 1000),
);

Future<List<int>> getIntsFromServer() async {
  await artificialDelay
      .trigger()
      .then((value) => stdout.writeln('Took: $value ms'));
  return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]..shuffle();
}

Future<void> main() async {
  stdout.writeln('Fetching list of ints from server...');
  final results = await getIntsFromServer();
  stdout.writeln('Received: $results');
}
