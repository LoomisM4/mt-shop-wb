import 'package:app/objects/gen/Category.dart';
import 'package:app/views/ArticleList.dart';
import 'package:app/views/Categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoriesWidget extends StatelessWidget { // 1
  CategoriesWidget(this.data); // 2

  List<Category> data; // 0

  @override // 1
  Widget build(BuildContext context) { // 1
    return ListView.builder( // 2
        itemCount: data.length, // 2
        itemBuilder: (context, i) { // 1
          Category c = data[i]; // 2
          return ListTile( // 2
              title: Text(c.name), // 3
              onTap: () { // 1
                if (c.links.subcategories != null) { // 4
                  Navigator.push( // 1
                      context,
                      MaterialPageRoute(builder: (context) => // 2
                          Categories(url: c.links.subcategories!.href, title: c.name) // 7
                      )
                  );
                } else if (c.links.articles != null) { // 4
                  Navigator.push( // 1
                      context,
                      MaterialPageRoute(builder: (context) => // 2
                          ArticleList(url: c.links.articles!.href, title: c.name) // 7
                      )
                  );
                }
              }
          );
        }
    );
  }
}

// 46
