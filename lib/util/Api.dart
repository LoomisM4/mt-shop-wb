import 'dart:convert';
import 'dart:developer';

import 'package:app/objects/Category.dart';
import 'package:app/objects/Response.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "https://shop.marcelwettach.eu";

  static Future<http.Response> spotlight() {
    return http.get(Uri.parse(baseUrl + "/spotlight"));
  }

  static Future<List<Category>> categories(String? url) async {
    url ??= baseUrl + "/categories";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Response res = Response.fromJson(json);
      return res.embedded.categories!;
    } else {
      return List.empty();
    }
  }

  static Future<http.Response> details(String url) {
    return http.get(Uri.parse(url));
  }

  static Future<http.Response> articles(String url) {
    return http.get(Uri.parse(url));
  }

  static Future<http.Response> image(String url) {
    return http.get(Uri.parse(url));
  }
}
