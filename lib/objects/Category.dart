import 'package:app/objects/Links.dart';

class Category {
  Category({
    required this.categoryId,
    required this.name,
    required this.links,
  });

  int categoryId;
  String name;
  Links links;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      categoryId: json["categoryId"],
      name: json["name"],
      links: Links.fromJson(json["_links"])
  );
}