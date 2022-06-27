import 'package:app/objects/gen/Article.dart';
import 'package:app/objects/gen/Link.dart';
import 'package:app/objects/gen/Links.dart';
import 'package:app/widgets/AsyncImageWidget.dart';
import 'package:app/widgets/SpotlightWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("can show multiple spotlight articles", (wt) async {
    Link l = Link(href: "");
    Links links = Links(spotlightImage: l, details: l);
    Article a1 = Article(id: 0, name: "Test1", price: 10);
    Article a2 = Article(id: 1, name: "Test2", price: 15);
    a1.links = links;
    a2.links = links;
    var testApp = MaterialApp(home: SpotlightWidget([a1, a2]));

    await wt.pumpWidget(testApp);

    expect(find.byType(AsyncImageWidget), findsNWidgets(2));
  });
}
