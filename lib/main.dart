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

class MyApp extends StatelessWidget { // 1
  const MyApp({Key? key}) : super(key: key); // 3

  @override // 1
  Widget build(BuildContext context) { // 1
    return MaterialApp( // 2
      home: CupertinoTabScaffold( // 2
        tabBar: CupertinoTabBar( // 2
            items: const [ // 1
              BottomNavigationBarItem(icon: Icon(Icons.star)), // 4
              BottomNavigationBarItem(icon: Icon(Icons.list)), // 4
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart)), // 4
              BottomNavigationBarItem(icon: Icon(Icons.map)) // 4
            ]
        ),
        tabBuilder: (context, i) { // 1
          switch (i) { // 1
            case 0: // 1
              return CupertinoTabView( // 2
                  builder: (context) { // 1
                    return const CupertinoPageScaffold( // 2
                        child: Spotlight() // 2
                    );
                  }
              );
            case 1: // 1
              return CupertinoTabView( // 2
                  builder: (context) { // 1
                    return const CupertinoPageScaffold( // 2
                        child: Categories(title: "Kategorien") // 3
                    );
                  }
              );
            case 2: // 1
              return CupertinoTabView( // 2
                  builder: (context) { // 1
                    return const CupertinoPageScaffold( // 2
                        child: Cart() // 2
                    );
                  }
              );
            case 3: // 1
              return CupertinoTabView( // 2
                  builder: (context) { // 1
                    return const CupertinoPageScaffold( // 2
                        child: Map() // 2
                    );
                  }
              );
            default: // 1
              return const Text("Es ist ein Fehler aufgetreten"); // 2
          }
        }
      ),
    );
  }
}

// 67
