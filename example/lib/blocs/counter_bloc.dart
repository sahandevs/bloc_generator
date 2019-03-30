import 'package:bloc_generator_annotation/bloc_generator_annotation.dart';
import 'package:rxdart/subjects.dart';

@BLoC()
class CounterBloc {

  @State()
  BehaviorSubject<int> counter = BehaviorSubject<int>.seeded(0);

  @Event()
  void add() {
    counter.value += 1;
  }

  @Event()
  void remove() {
    counter.value -= 1;
  }
  
  @Dispose()
  void dispose() {
    counter.close();
  }
  
}