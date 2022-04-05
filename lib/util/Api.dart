import 'dart:convert';
import 'dart:developer';

import 'package:app/objects/Article.dart';
import 'package:app/objects/Category.dart';
import 'package:app/objects/Link.dart';
import 'package:app/objects/Response.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "https://shop.marcelwettach.eu";

  static Future<List<Article>> spotlight() async {
    final response = await http.get(Uri.parse(baseUrl + "/spotlight"));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Response res = Response.fromJson(json);
      return res.embedded.articles ?? List.empty();
    } else {
      return List.empty();
    }
  }

  static Future<List<Category>> categories(String? url) async {
    url ??= baseUrl + "/categories";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Response res = Response.fromJson(json);
      return res.embedded.categories ?? List.empty();
    } else {
      return List.empty();
    }
  }

  static Future<Article?> details(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return Article.fromJson(json);
    } else {
      return null;
    }
  }

  static Future<List<Article>> articles(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return Response.fromJson(json).embedded.articles ?? List.empty();
    } else {
      return List.empty();
    }
  }

  static Future<Image?> image(String url) async {
    Image i = Image.network(url);
    return i;
  }
}
