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
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: const TabBarView(
            children: [
              Spotlight(),
              Categories(title: "Kategorien"),
              Cart(),
              Map()
            ]
          ),
          bottomNavigationBar: BottomAppBar(
            child: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.star)),
                Tab(icon: Icon(Icons.list)),
                Tab(icon: Icon(Icons.shopping_cart)),
                Tab(icon: Icon(Icons.map))
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
