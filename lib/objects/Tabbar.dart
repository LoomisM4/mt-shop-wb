import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      child: TabBar(
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
    );
  }
}
