import 'dart:developer';

import 'package:app/objects/Article.dart';

class CartObj {
  static final CartObj _cartObj = CartObj._internal();
  factory CartObj() => _cartObj;

  late List<CartArticle> articles;

  CartObj._internal() {
    articles = List.empty(growable: true);
    log("HALLO");
  }

  double calcTotalPrice() {
    return articles.fold(0.0, (sum, ca) => sum + ca.calcPositionPrice());
  }

  add(Article article) {
    bool alreadyContains = articles.any((element) => element.article == article);
    if (alreadyContains) {
      CartArticle ca = articles.firstWhere((element) => element.article == article);
      ca.quantity++;
    } else {
      CartArticle ca = CartArticle(article: article);
      articles.add(ca);
    }
  }

  remove(Article article) {
    bool alreadyContains = articles.any((element) => element.article == article);
    if (alreadyContains) {
      CartArticle ca = articles.firstWhere((element) => element.article == article);
      if (ca.quantity > 0) {
        ca.quantity--;
      }
    }
  }
}

class CartArticle {
  CartArticle({required this.article});

  Article article;
  int quantity = 1;

  double calcPositionPrice() {
    return (article.price ?? 0) * quantity;
  }
}
