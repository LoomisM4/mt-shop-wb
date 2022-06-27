import 'package:app/objects/gen/Article.dart';
import 'package:app/objects/CartObj.dart';
import 'package:app/views/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("widget has 2 entries", (wt) async {
    var testApp = const MaterialApp(home: Cart());
    Article a1 = Article(id: 0, name: "Test1", price: 10);
    Article a2 = Article(id: 1, name: "Test2", price: 15);
    CartObj().add(a1);
    CartObj().add(a1);
    CartObj().add(a2);

    await wt.pumpWidget(testApp);

    expect(find.text("Test1"), findsOneWidget);
    expect(find.text("Test2"), findsOneWidget);
    expect(find.text("2"), findsOneWidget); // 2x a1
    expect(find.text("1"), findsOneWidget); // 1x a2
    expect(find.text("20.00"), findsOneWidget); // position a1
    expect(find.text("15.00"), findsOneWidget); // position a2
    expect(find.text("35.00"), findsOneWidget); // total

    await wt.tap(find.byIcon(Icons.add).first);
    await wt.pumpAndSettle(const Duration(milliseconds: 100));
    expect(find.text("3"), findsOneWidget); // 3x a1
    expect(find.text("30.00"), findsOneWidget); // position a1
    expect(find.text("45.00"), findsOneWidget); // total

    await wt.tap(find.byIcon(Icons.remove).first);
    await wt.pumpAndSettle(const Duration(milliseconds: 100));
    expect(find.text("2"), findsOneWidget); // 3x a1
    expect(find.text("20.00"), findsOneWidget); // position a1
    expect(find.text("35.00"), findsOneWidget); // total
  });
}
