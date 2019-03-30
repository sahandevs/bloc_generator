library bloc_generator.dart;

import 'package:build/build.dart';
import 'src/generator.dart';

Builder blocGeneratorFactory(BuilderOptions options) =>
    blocGeneratorFactoryBuilder(header: options.config['header'] as String);
