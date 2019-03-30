library bloc_generator_flutter_helper;

import 'package:flutter/widgets.dart';

class StreamBuilderHelper<T> {

  Stream<T> stream;

  StreamBuilderHelper({this.stream});

  StreamBuilder<T> call({Key key, T initialData, AsyncWidgetBuilder<T> builder}) {
    return StreamBuilder<T>(
      stream: stream,
      key: key,
      initialData: initialData,
      builder: builder,
    );
  }

}
