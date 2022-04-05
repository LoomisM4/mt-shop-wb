import 'dart:convert';
import 'dart:developer';

import 'package:app/objects/Article.dart';
import 'package:app/objects/Category.dart';
import 'package:app/objects/Response.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static const baseUrl = "https://shop.marcelwettach.eu";
  static bool online = true;

  static Future<Map<String, dynamic>> webOrCache(String url) async {
    final prefs = await SharedPreferences.getInstance();
    if (online) {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log("caching");
        prefs.setString(url, response.body);
        return jsonDecode(response.body);
      } else {
        return <String, dynamic>{};
      }
    } else {
      log("serving from cache");
      return jsonDecode(prefs.getString(url) ?? "");
    }
  }

  static Future<List<Article>> spotlight() async {
    final json = await webOrCache(baseUrl + "/spotlight");
    Response res = Response.fromJson(json);
    return res.embedded.articles ?? List.empty();
  }

  static Future<List<Category>> categories(String? url) async {
    url ??= baseUrl + "/categories";
    final json = await webOrCache(url);
    Response res = Response.fromJson(json);
    return res.embedded.categories ?? List.empty();
  }

  static Future<Article> details(String url) async {
    final json = await webOrCache(url);
    return Article.fromJson(json);
  }

  static Future<List<Article>> articles(String url) async {
    final json = await webOrCache(url);
    return Response.fromJson(json).embedded.articles ?? List.empty();
  }

  static Future<Image?> image(String url) async {
    final prefs = await SharedPreferences.getInstance();
    String? base64;
    if (online) {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        base64 = base64Encode(response.bodyBytes);
        log("caching");
        prefs.setString(url, base64);
      }
    } else {
      log("serving from cache");
      base64 = prefs.getString(url);
    }
    return Image.memory(base64Decode(base64 ?? ""));
  }
}
