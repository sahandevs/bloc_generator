import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'package:build/build.dart';

import 'package:source_gen/source_gen.dart';
import 'package:bloc_generator_annotation/bloc_generator_annotation.dart'
    as bloc;

const INSTANCE_NAME = "bloc";

const STATE_PREFIX = "state_";
const STATE_BUILDER_PREFIX = "builder_";
const EVENT_PREFIX = "event_";
const CLASS_SUFFIX = "Mixin";

String stateTemplate(String name, DartType type) =>
    "${type.displayName} get $STATE_PREFIX$name => $INSTANCE_NAME.$name;";

String stateBuilderTemplate(String name, DartType type) {
  String genericType =
      (type as ParameterizedType).typeParameters.first.displayName;
  String helperType = "StreamBuilderHelper<$genericType>";
  String helperBuilder = "$helperType(stream: $INSTANCE_NAME.$name)";
  return "$helperType get $STATE_BUILDER_PREFIX$name => $helperBuilder;";
}

String classTemplate(ClassElement element, String body) {
  var className = "${element.name}$CLASS_SUFFIX";
  return """abstract class $className {
    ${element.type.displayName} $INSTANCE_NAME = ${element.name}();
    
    $body
    
  }""";
}

String eventTemplate(String name) =>
    "void $EVENT_PREFIX$name() => $INSTANCE_NAME.$name();";

class BLoCGenerator extends GeneratorForAnnotation<bloc.BLoC> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      final friendlyName = element.displayName;
      throw new InvalidGenerationSourceError(
        'Generator cannot target `$friendlyName`.',
        todo: 'Remove the [BLoC] annotation from `$friendlyName`.',
      );
    }

    // TODO: check if class has a single constructor with no parameters and not private

    return buildMixin(element, annotation);
  }

  String buildMixin(ClassElement element, ConstantReader annotation) {
    List<String> states = buildStates(element, annotation);
    List<String> builders = buildStateBuilder(element, annotation);
    List<String> events = buildEvents(element, annotation);
    List<String> total = states + builders + events;

    return classTemplate(element, total.join("\n\n"));
  }

  List<String> buildStates(ClassElement element, ConstantReader annotation) {
    return element.fields
        .where((item) =>
            !item.name.startsWith("_") &&
            (item.type.name == "BehaviorSubject" || item.type.name == "Stream"))
        .map((item) => stateTemplate(item.name, item.type))
        .toList();
  }

  List<String> buildStateBuilder(
      ClassElement element, ConstantReader annotation) {
    return element.fields
        .where((item) =>
            !item.name.startsWith("_") &&
            (item.type.name == "BehaviorSubject" || item.type.name == "Stream"))
        .map((item) => stateBuilderTemplate(item.name, item.type))
        .toList();
  }

  List<String> buildEvents(ClassElement element, ConstantReader annotation) {
    return element.methods
        .where((item) =>
            !item.name.startsWith("_") &&
            item.returnType.name == "void" &&
            item.name != "dispose" &&
            item.parameters.length == 0)
        .map((item) => eventTemplate(item.name))
        .toList();
  }
}

Builder blocGeneratorFactoryBuilder({String header}) => new PartBuilder(
      [new BLoCGenerator()],
      ".bloc.dart",
      header: header,
    );
