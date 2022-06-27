import 'package:app/views/Categories.dart';
import 'package:app/widgets/CategoriesWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets("loads the categories", (wt) async {
    SharedPreferences.setMockInitialValues({
      "https://shop.marcelwettach.eu/categories": categories()
    });
    var testApp = const MaterialApp(home: Categories(title: "Kategorien"));
    await wt.pumpWidget(testApp);
    await wt.pump(const Duration(milliseconds: 2000));

    expect(find.text("Kategorien"), findsOneWidget);
    expect(find.byType(CategoriesWidget), findsNWidgets(1));
    expect(find.text("Neu"), findsOneWidget);
  });
}

String categories() {
  return "{\"_embedded\":{\"categories\":[{\"categoryId\":0,\"name\":\"Neu\",\"_links\":{\"subcategories\":{\"href\":\"http://shop.marcelwettach.eu/category/0\"}}}]}}";
}
