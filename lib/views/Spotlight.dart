import 'package:app/objects/gen/Article.dart';
import 'package:app/util/Api.dart';
import 'package:app/widgets/SpotlightWidget.dart';
import 'package:flutter/material.dart';

class Spotlight extends StatefulWidget { // 1
  const Spotlight({Key? key}) : super(key: key); // 3

  @override // 1
  _SpotlightState createState() => _SpotlightState(); // 2
}

class _SpotlightState extends State<Spotlight> { // 1
  late Future<List<Article>> articles; // 0

  @override // 1
  void initState() { // 1
    super.initState(); // 1
    articles = Api.spotlight(); // 2
  }

  @override // 1
  Widget build(BuildContext context) { // 1
    return Scaffold( // 2
      appBar: AppBar( // 2
        title: const Text("Spotlight"), // 2
        backgroundColor: Colors.white, // 2
        foregroundColor: Colors.black, // 2
      ),
      body: FutureBuilder<List<Article>>( // 2
        future: articles, // 1
        builder: (context, snapshot) { // 1
          if (snapshot.hasData && snapshot.data != null) { // 5
            return SpotlightWidget(snapshot.data!); // 3
          } else if (snapshot.hasError) { // 2
            return Text(snapshot.error.toString()); // 4
          } else { // 1
            return const CircularProgressIndicator(); // 2
          }
        }
      )
    );
  }
}

// 46
