import 'package:artificial_delay/artificial_delay.dart';

final artificialDelay = ArtificialDelay(
  minDelay: Duration(milliseconds: 100),
  maxDelay: Duration(milliseconds: 1000),
);

Future<List<int>> getIntsFromServer() async {
  await artificialDelay.trigger().then((value) => print('Took: $value ms'));
  return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]..shuffle();
}

Future<void> main() async {
  print('Fetching list of ints from server...');
  getIntsFromServer().then((value) => print('Received: $value'));
}
