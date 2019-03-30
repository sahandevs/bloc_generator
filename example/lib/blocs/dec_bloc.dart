
import 'package:bloc_generator_annotation/bloc_generator_annotation.dart';
import 'package:rxdart/subjects.dart';
import 'package:bloc_generator_flutter_helper/bloc_generator_flutter_helper.dart';
part 'dec_bloc.bloc.dart';

@BLoC()
class DecBloc {

  BehaviorSubject<Model> counter = BehaviorSubject<List<int>>.seeded(null);

  void add(int item) => counter.add(counter.value + [item]);

  void remove(int item) => counter.add(counter.value.where((item) => item != item).toList());

  void dispose() {
    counter.close();
  }

}