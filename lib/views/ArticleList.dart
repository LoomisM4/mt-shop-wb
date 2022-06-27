import 'package:app/objects/gen/Article.dart';
import 'package:app/util/Api.dart';
import 'package:app/widgets/AsyncImageWidget.dart';
import 'package:flutter/material.dart';

class ArticleList extends StatefulWidget { // 1
  const ArticleList({Key? key, required this.url, required this.title}) : super(key: key); // 5

  final String url; // 0
  final String title; // 0

  @override // 1
  _ArticleListState createState() => _ArticleListState(url: url, title: title); // 4
}

class _ArticleListState extends State<ArticleList> { // 1
  _ArticleListState({required this.url, required this.title}); // 3
  late Future<List<Article>> articles; // 0

  String url; // 0
  String title; // 0

  @override // 1
  void initState() { // 1
    super.initState(); // 1
    articles = Api.articles(url); // 2
  }

  @override // 1
  Widget build(BuildContext context) { // 1
    return Scaffold( // 2
      appBar: AppBar( // 2
        title: Text(title), // 2
        backgroundColor: Colors.white, // 2
        foregroundColor: Colors.black, // 2
      ),
      body: FutureBuilder<List<Article>>( // 2
        future: articles, // 1
        builder: (context, list) { // 1
          if (list.hasData) { // 2
            return GridView.count( // 2
              crossAxisCount: 2, // 1
              children: // 1
                List.generate(list.data!.length, (i) { // 3
                  if (list.data![i].links?.preview != null) { // 5
                    return AsyncImageWidget( // 2
                      imgUrl: list.data![i].links!.preview!.href, // 5
                      detailsUrl: list.data![i].links!.details?.href); // 5
                  } else { // 1
                    return const Center( // 2
                      child: Text("Keine Vorschau verfügbar") // 2
                    );
                  }
                })
            );
          } else if (list.hasError) { // 2
            return Text(list.error.toString()); // 4
          } else { // 1
            return const CircularProgressIndicator(); // 2
          }
        }
      ),
    );
  }
}

// 76
