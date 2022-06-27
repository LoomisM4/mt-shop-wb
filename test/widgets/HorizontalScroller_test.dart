import 'package:app/widgets/HorizontalScroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("two widgets can be shown", (wt) async {
    var t1 = const Text("Test1");
    var t2 = const Text("Test2");
    var testApp = MaterialApp(home: HorizontalScroller(children: [
      t1, t2
    ]));

    await wt.pumpWidget(testApp);

    expect(find.text("Test1"), findsOneWidget);
    expect(find.text("Test2"), findsOneWidget);
  });
}
