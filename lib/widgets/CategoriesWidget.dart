import 'package:app/objects/Category.dart';
import 'package:app/views/ArticleList.dart';
import 'package:app/views/Categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget(this.data);

  List<Category> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, i) {
          Category c = data[i];
          return ListTile(
              title: Text(c.name),
              onTap: () {
                if (c.links.subcategories != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          Categories(url: c.links.subcategories!.href, title: c.name)
                      )
                  );
                } else if (c.links.articles != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          ArticleList(url: c.links.articles!.href, title: c.name)
                      )
                  );
                }
              }
          );
        }
    );
  }
}
