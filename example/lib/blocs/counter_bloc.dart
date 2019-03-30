import 'package:bloc_generator_annotation/bloc_generator_annotation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:bloc_generator_annotation/bloc_generator_annotation.dart';
import 'package:bloc_generator_flutter_helper/bloc_generator_flutter_helper.dart';
part 'counter_bloc.bloc.dart';

@BLoC()
class CounterBloc {

  BehaviorSubject<int> counter = BehaviorSubject<int>.seeded(0);

  void add() {
    counter.value += 1;
  }

  void remove() {
    counter.value -= 1;
  }

  void dispose() {
    counter.close();
  }
  
}
