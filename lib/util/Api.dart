import 'dart:convert';
import 'dart:developer';

import 'package:app/objects/gen/Article.dart';
import 'package:app/objects/gen/Category.dart';
import 'package:app/objects/gen/Response.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api { // 1
  static const baseUrl = "https://shop.marcelwettach.eu"; // 1

  static Future<Map<String, dynamic>> webOrCache(String url) async { // 1
    final prefs = await SharedPreferences.getInstance(); // 2
    final response = await http.get(Uri.parse(url)); // 3
    if (response.statusCode == 200) { // 3
      log("caching"); // 0
      prefs.setString(url, response.body); // 2
      return jsonDecode(response.body); // 3
    } else { // 1
      log("serving from cache"); // 0
      return jsonDecode(prefs.getString(url) ?? ""); // 4
    }
  }

  static Future<List<Article>> spotlight() async { // 1
    final json = await webOrCache(baseUrl + "/spotlight"); // 3
    Response res = Response.fromJson(json); // 2
    return res.embedded.articles ?? List.empty(); // 5
  }

  static Future<List<Category>> categories(String? url) async { // 1
    url ??= baseUrl + "/categories"; // 2
    final json = await webOrCache(url); // 2
    Response res = Response.fromJson(json); // 2
    return res.embedded.categories ?? List.empty(); // 5
  }

  static Future<Article> details(String url) async { // 1
    final json = await webOrCache(url); // 2
    return Article.fromJson(json); // 2
  }

  static Future<List<Article>> articles(String url) async { // 1
    final json = await webOrCache(url); // 2
    return Response.fromJson(json).embedded.articles ?? List.empty(); // 6
  }

  static Future<Image?> image(String url) async { // 1
    final prefs = await SharedPreferences.getInstance(); // 2
    String? base64; // 0
    final response = await http.get(Uri.parse(url)); // 3
    if (response.statusCode == 200) { // 3
      base64 = base64Encode(response.bodyBytes); // 3
      log("caching"); // 0
      prefs.setString(url, base64); // 1
    } else { // 1
      log("serving from cache"); // 0
      base64 = prefs.getString(url); // 2
    }
    return Image.memory(base64Decode(base64 ?? "")); // 4
  }
}

// 78
