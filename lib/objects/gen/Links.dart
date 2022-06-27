import 'package:app/objects/gen/Link.dart';

class Links {
  Links({
    this.subcategories,
    this.articles,
    this.preview,
    this.details,
    this.spotlightImage,
    this.images
  });

  Link? subcategories, articles, preview, details, spotlightImage;
  List<Link>? images;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    spotlightImage: json["spotlightImage"] == null ? null : Link.fromJson(json["spotlightImage"]),
    articles: json["articles"] == null ? null : Link.fromJson(json["articles"]),
    preview: json["preview"] == null ? null : Link.fromJson(json["preview"]),
    details: json["details"] == null ? null : Link.fromJson(json["details"]),
    subcategories: json["subcategories"] == null ? null : Link.fromJson(json["subcategories"]),
    images: json["images"] == null ? null : List<Link>.from(json["images"].map((i) => Link.fromJson(i)))
  );
}
