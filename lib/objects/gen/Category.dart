import 'dart:convert';

import 'package:app/objects/gen/Links.dart';

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
      name: utf8.decode(json["name"].toString().codeUnits),
      links: Links.fromJson(json["_links"])
  );
}
