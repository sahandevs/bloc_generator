import 'dart:async';

import 'package:analyzer/dart/element/element.dart';

import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';

import 'package:source_gen/source_gen.dart';
import 'package:bloc_generator_annotation/bloc_generator_annotation.dart'
    as bloc;

class BLoCGenerator extends GeneratorForAnnotation<bloc.BLoC> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    print("builder ***********************");
    return "";
  }
}

Builder blocGeneratorFactoryBuilder({String header}) => new PartBuilder(
      [new BLoCGenerator()],
      ".bloc.dart",
      header: header,
    );
