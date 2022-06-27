class Link {
  Link({
    required this.href,
  });

  String href;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    href: json["href"],
  );
}
