import 'package:app/objects/Embedded.dart';

class Response {
  Response({
    required this.embedded,
  });

  Embedded embedded;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    embedded: Embedded.fromJson(json["_embedded"]),
  );
}
