import 'package:app/objects/Article.dart';
import 'package:app/util/Api.dart';
import 'package:app/widgets/AsyncImageWidget.dart';
import 'package:flutter/material.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({Key? key, required this.url, required this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  _ArticleListState createState() => _ArticleListState(url: url, title: title);
}

class _ArticleListState extends State<ArticleList> {
  _ArticleListState({required this.url, required this.title});
  late Future<List<Article>> articles;

  String url;
  String title;

  @override
  void initState() {
    super.initState();
    articles = Api.articles(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Article>>(
        future: articles,
        builder: (context, list) {
          if (list.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children:
                List.generate(list.data!.length, (i) {
                  if (list.data![i].links?.preview != null) {
                    return AsyncImageWidget(
                      imgUrl: list.data![i].links!.preview!.href,
                      detailsUrl: list.data![i].links!.details?.href);
                  } else {
                    return const Center(
                      child: Text("Keine Vorschau verfügbar")
                    );
                  }
                })
            );
          } else if (list.hasError) {
            return Text(list.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        }
      ),
    );
  }
}
