// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dec_bloc.dart';

// **************************************************************************
// BLoCGenerator
// **************************************************************************

abstract class DecBlocMixin {
  DecBloc bloc = DecBloc();

  BehaviorSubject<List<int>> get state_counter => bloc.counter;

  StreamBuilderHelper<List<int>> get builder_counter =>
      StreamBuilderHelper<List<int>>(stream: bloc.counter);
}
