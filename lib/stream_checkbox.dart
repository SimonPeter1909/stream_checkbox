library stream_checkbox;

import 'dart:async';

import 'package:flutter/material.dart';

class StreamCB extends StatelessWidget {
  final Function(BuildContext context) onChecked;
  final Function(BuildContext context) onUnChecked;
  final bool initialValue;
  final _cbController = StreamController<bool>.broadcast();

  StreamCB(
      {@required this.onChecked,
        @required this.onUnChecked,
        this.initialValue = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<bool>(
          stream: _cbController.stream,
          initialData: initialValue,
          builder: (context, snapshot) {
            return Checkbox(
                value: snapshot.data,
                onChanged: (val) {
                  if (val) {
                    onChecked(context);
                  } else {
                    onUnChecked(context);
                  }
                  _cbController.add(val);
                });
          }),
    );
  }
}
