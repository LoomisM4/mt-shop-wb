import 'dart:ffi';

import 'package:app/objects/Article.dart';

class CartObj {
  static final CartObj _cartObj = CartObj();
  late List<CartArticle> articles;

  factory CartObj() {
    _cartObj.articles = List.empty(growable: true);
    return _cartObj;
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
      if (ca.quantity > 1) {
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
