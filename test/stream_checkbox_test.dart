import 'package:flutter_test/flutter_test.dart';

import 'package:stream_checkbox/stream_checkbox.dart';

void main() {
  test('adds one to input values', () {
    final streamCB = StreamCB(
      onChecked: (context) {
        print('checked');
      },
      onUnChecked: (context) {
        print('un checked');
      },
    );
    expect(streamCB.onChecked, {print('checked')});
    expect(streamCB.onUnChecked, {print('un checked')});
  });
}
