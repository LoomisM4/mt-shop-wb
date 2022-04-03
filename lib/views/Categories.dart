import 'package:app/objects/Category.dart';
import 'package:app/util/Api.dart';
import 'package:app/views/ArticleList.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key, this.url, required this.title}) : super(key: key);

  final String? url;
  final String title;

  @override
  _CategoriesState createState() => _CategoriesState(url, title);
}

class _CategoriesState extends State<Categories> {
  _CategoriesState(this.url, this.title);

  late Future<List<Category>> categories;
  String? url;
  String title;

  @override
  void initState() {
    super.initState();
    categories = Api.categories(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Category>>(
        future: categories,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) {
                Category c = snapshot.data![i];
                return ListTile(
                  title: Text(c.name),
                  onTap: () {
                    if (c.links.subcategories != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              Categories(url: c.links.subcategories!.href, title: c.name))
                      );
                    } else if (c.links.articles != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              ArticleList(url: c.links.articles!.href, title: c.name))
                      );
                    }
                  }
                );
              }
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
