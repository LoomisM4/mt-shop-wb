import 'package:app/views/Cart.dart';
import 'package:app/views/Categories.dart';
import 'package:app/views/Map.dart';
import 'package:app/views/Spotlight.dart';
import 'package:flutter/cupertino.dart';
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
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.star)),
              BottomNavigationBarItem(icon: Icon(Icons.list)),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart)),
              BottomNavigationBarItem(icon: Icon(Icons.map))
            ]
        ),
        tabBuilder: (context, i) {
          switch (i) {
            case 0:
              return CupertinoTabView(
                  builder: (context) {
                    return const CupertinoPageScaffold(
                        child: Spotlight()
                    );
                  }
              );
            case 1:
              return CupertinoTabView(
                  builder: (context) {
                    return const CupertinoPageScaffold(
                        child: Categories(title: "Kategorien")
                    );
                  }
              );
            case 2:
              return CupertinoTabView(
                  builder: (context) {
                    return const CupertinoPageScaffold(
                        child: Cart()
                    );
                  }
              );
            case 3:
              return CupertinoTabView(
                  builder: (context) {
                    return const CupertinoPageScaffold(
                        child: Map()
                    );
                  }
              );
            default:
              return const Text("Es ist ein Fehler aufgetreten");
          }
        }
      ),
    );
  }
}
