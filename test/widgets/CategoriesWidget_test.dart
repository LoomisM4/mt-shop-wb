
import 'package:app/objects/gen/Category.dart';
import 'package:app/objects/gen/Link.dart';
import 'package:app/objects/gen/Links.dart';
import 'package:app/widgets/CategoriesWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("widget has entries", (wt) async {
    Link link = Link(href: "TestUrl");
    Links links1 = Links(subcategories: link);
    Links links2 = Links(articles: link);
    Category category1 = Category(categoryId: 0, name: "Test1", links: links1);
    Category category2 = Category(categoryId: 1, name: "Test2", links: links2);
    List<Category> data = [category1, category2];

    var testApp = MaterialApp(home: Drawer(child: CategoriesWidget(data)));

    await wt.pumpWidget(testApp);

    expect(find.text("Test1"), findsOneWidget);
  });
}
