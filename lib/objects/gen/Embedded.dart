import 'package:app/objects/gen/Article.dart';
import 'package:app/objects/gen/Category.dart';

class Embedded {
  Embedded({
    this.categories,
    this.articles
  });

  List<Category>? categories;
  List<Article>? articles;

  factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
    categories: json["categories"] == null ? null :
      List<Category>.from(json["categories"].map((c) => Category.fromJson(c))),
    articles: json["articles"] == null ? null :
      List<Article>.from(json["articles"].map((a) => Article.fromJson(a)))
  );
}
