import 'package:app/widgets/AsyncImageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets("shows progress indicator", (wt) async {
    SharedPreferences.setMockInitialValues({});
    var testApp = MaterialApp(home: AsyncImageWidget(imgUrl: ""));

    await wt.pumpWidget(testApp);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
