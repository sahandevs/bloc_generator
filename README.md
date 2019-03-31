# BLoC Generator

experimental implementation of code generator for BLoC pattern

## Installation

```yaml
dependencies:
    bloc_generator_annotation: ^1.0.0
    bloc_generator_flutter_helper: ^1.0.0

dev_dependencies:
  build_runner: ^1.0.0
  bloc_gen: ^1.0.1

```
the run

```sh
flutter packages get
```

## Run Builder

```sh
flutter packages pub run build_runner build # [watch, serve]
```

## Usage

Note: Supports `BehaviorSubject` (rxDart) and `Stream`

create a dart file `<file_name>.dart`

```dart
import 'package:bloc_generator_flutter_helper/bloc_generator_flutter_helper.dart';
import 'package:bloc_generator_annotation/bloc_generator_annotation.dart';

part '<file_name>.bloc.dart';

@BLoC()
class TestBloc {

  // your logic here

  void test() { }

}
```

run `flutter packages pub run build_runner build`

and this will generate a file named `<file_name>.bloc.dart`
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_bloc.dart';

// **************************************************************************
// BLoCGenerator
// **************************************************************************

abstract class TestBlocMixin {
  TestBloc bloc = TestBloc();

  void event_test() => bloc.test();
}

```

now use this mixin like this:
```dart
// for stateful widget
class _WidgetState extends State<MyHomePage> with TestBlocMixin { }
// for stateless widget
class Widget extends StatelessWidget with TestBlocMixin {}
```

> DO NOT FORGET TO CLOSE THE STREAMS

[FULL EXAMPLE](./example/README.md)

## TODO:

- FULL DOCUMENTATION

## Hacky way to use with Android Studio's Run Configurations
TODO