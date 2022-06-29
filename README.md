# artificial_delay

A dart package to simulate artificial delays from volatile data providers.

## Features

* Extremely tiny package
* Portable, no external packages necessary

## Getting started

Simply add `artificial_delay` to your `pubspec.yaml` using `dart pub add artificial_delay`.

## Usage

```dart
import 'package:artificial_delay/artificial_delay.dart';

final artificialDelay = ArtificialDelay(
  minDelay: Duration(milliseconds: 100),
  maxDelay: Duration(milliseconds: 1000),
);

artificialDelay.trigger();
```
