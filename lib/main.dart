import 'package:app/objects/Tabbar.dart';
import 'package:app/views/Cart.dart';
import 'package:app/views/Categories.dart';
import 'package:app/views/Map.dart';
import 'package:app/views/Spotlight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              Spotlight(),
              Categories(title: "Kategorien"),
              Cart(),
              Map()
            ]
          ),
          bottomNavigationBar: Tabbar()
        ),
      ),
    );
  }
}
