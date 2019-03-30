import 'package:flutter/widgets.dart';

class BLoC {

  const BLoC();

}


// TODO: create another file

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
