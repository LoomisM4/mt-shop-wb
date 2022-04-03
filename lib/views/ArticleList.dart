import 'package:flutter/material.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({Key? key, required this.url, required this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const Text("TODO"),
    );
  }
}
