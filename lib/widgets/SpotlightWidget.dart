import 'package:app/objects/Article.dart';
import 'package:app/widgets/AsyncImageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpotlightWidget extends StatelessWidget {
  SpotlightWidget(this.data);

  List<Article> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, i) {
        return AsyncImageWidget(
          imgUrl: data[i].links!.spotlightImage!.href,
          detailsUrl: data[i].links!.details!.href
        );
      }
    );
  }
}
