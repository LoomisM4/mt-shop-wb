import 'package:app/objects/Links.dart';

class Article {
  Article({
    required this.id,
    this.name,
    this.price,
    this.description,
    this.links,
  });

  int id;
  String? name;
  double? price;
  String? description;
  Links? links;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    links: Links.fromJson(json["_links"])
  );
}
