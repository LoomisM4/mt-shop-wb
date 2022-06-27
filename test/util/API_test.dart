import 'package:app/util/Api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test("loads spotlight articles", () async {
    SharedPreferences.setMockInitialValues({});
    var list = await Api.spotlight();

    expect(list, hasLength(3));
  });

  test("loads article details", () async {
    SharedPreferences.setMockInitialValues({});
    var details = await Api.details("https://shop.marcelwettach.eu/details/0");

    expect(details.name, equals("T-Shirt"));
    expect(details.description, equals("Blaues T-Shirt aus 100 % Baumwolle"));
    expect(details.price, equals(15.99));
    expect(details.links!.images, isNotEmpty);
  });

  test("loads articles", () async {
    SharedPreferences.setMockInitialValues({});
    var articles = await Api.articles("https://shop.marcelwettach.eu/category/0/articles");

    expect(articles, hasLength(4));
    expect(articles.every((a) => a.links!.preview != null), isTrue);
  });

  test("loads categories", () async {
    SharedPreferences.setMockInitialValues({});
    var categories = await Api.categories(null);

    expect(categories, hasLength(6));
    expect(categories.first.name, equals("Neu"));
    expect(categories.every((c) => c.links.subcategories != null), isTrue);
  });
}

String spotlight() {
  return "{\"_embedded\":{\"articles\":[{\"id\":0,\"_links\":{\"spotlightImage\":{\"href\":\"http://shop.marcelwettach.eu/resources/img/spotlight/S1.jpg\"},\"details\":{\"href\":\"http://shop.marcelwettach.eu/details/0\"}}}]}}";
}
