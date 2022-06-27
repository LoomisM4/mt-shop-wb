import 'dart:developer';

import 'package:app/objects/gen/Article.dart';

class CartObj { // 1
  static final CartObj _cartObj = CartObj._internal(); // 2
  factory CartObj() => _cartObj; // 1

  late List<CartArticle> articles; // 0

  CartObj._internal() { // 1
    articles = List.empty(growable: true); // 3
  }

  double calcTotalPrice() { // 1
    return articles.fold(0.0, (sum, ca) => sum + ca.calcPositionPrice()); // 4
  }

  add(Article article) { // 1
    bool alreadyContains = articles.any((element) => element.article.id == article.id); // 6
    if (alreadyContains) { // 2
      CartArticle ca = articles.firstWhere((element) => element.article.id == article.id); // 6
      ca.quantity++; // 2
    } else { // 1
      CartArticle ca = CartArticle(article: article); // 3
      articles.add(ca); // 1
    }
  }

  remove(Article article) { // 1
    bool alreadyContains = articles.any((element) => element.article.id == article.id); // 6
    if (alreadyContains) { // 2
      CartArticle ca = articles.firstWhere((element) => element.article.id == article.id); // 6
      if (ca.quantity > 0) { // 3
        ca.quantity--; // 2
      }
    }
  }
}

class CartArticle { // 1
  CartArticle({required this.article}); // 2

  Article article; // 0
  int quantity = 1; // 1

  double calcPositionPrice() { // 1
    return (article.price ?? 0) * quantity; // 4
  }
}

// 64
