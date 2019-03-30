// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_bloc.dart';

// **************************************************************************
// BLoCGenerator
// **************************************************************************

abstract class CounterBlocMixin {
  CounterBloc bloc = CounterBloc();

  BehaviorSubject<int> get state_counter => bloc.counter;

  StreamBuilderHelper<int> get builder_counter =>
      StreamBuilderHelper<int>(stream: bloc.counter);

  void event_add() => bloc.add();

  void event_remove() => bloc.remove();
}
