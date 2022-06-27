import 'package:app/objects/gen/Category.dart';
import 'package:app/util/Api.dart';
import 'package:app/views/ArticleList.dart';
import 'package:app/widgets/CategoriesWidget.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget { // 1
  const Categories({Key? key, this.url, required this.title}) : super(key: key); // 5

  final String? url; // 0
  final String title; // 0

  @override // 1
  _CategoriesState createState() => _CategoriesState(url, title); // 2
}

class _CategoriesState extends State<Categories> { // 1
  _CategoriesState(this.url, this.title); // 3

  late Future<List<Category>> categories; // 0
  String? url; // 0
  String title; // 0

  @override // 1
  void initState() { // 1
    super.initState(); // 1
    categories = Api.categories(url); // 2
  }

  @override // 1
  Widget build(BuildContext context) { // 1
    return Scaffold( // 2
      appBar: AppBar( // 2
        title: Text(title), // 2
        backgroundColor: Colors.white, // 2
        foregroundColor: Colors.black, // 2
      ),
      body: FutureBuilder<List<Category>>( // 2
        future: categories, // 1
        builder: (context, snapshot) { // 1
          if (snapshot.hasData && snapshot.data != null) { // 5
            return CategoriesWidget(snapshot.data!); // 3
          } else if (snapshot.hasError) { // 2
            return Text(snapshot.error.toString()); // 4
          } else { // 1
            return const CircularProgressIndicator(); // 2
          }
        },
      ),
    );
  }
}

// 51
