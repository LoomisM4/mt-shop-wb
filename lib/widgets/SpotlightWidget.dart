import 'package:app/objects/gen/Article.dart';
import 'package:app/widgets/AsyncImageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpotlightWidget extends StatelessWidget { // 1
  SpotlightWidget(this.data); // 2

  List<Article> data; // 0

  @override // 1
  Widget build(BuildContext context) { // 1
    return ListView.builder( // 2
      itemCount: data.length, // 2
      itemBuilder: (context, i) { // 1
        return AsyncImageWidget( // 2
          imgUrl: data[i].links!.spotlightImage!.href, // 5
          detailsUrl: data[i].links!.details!.href // 5
        );
      }
    );
  }
}

// 22
