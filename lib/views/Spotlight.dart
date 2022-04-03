import 'package:app/objects/Article.dart';
import 'package:app/util/Api.dart';
import 'package:app/widgets/SpotlightWidget.dart';
import 'package:flutter/material.dart';

class Spotlight extends StatefulWidget {
  const Spotlight({Key? key}) : super(key: key);

  @override
  _SpotlightState createState() => _SpotlightState();
}

class _SpotlightState extends State<Spotlight> {
  late Future<List<Article>> articles;

  @override
  void initState() {
    super.initState();
    articles = Api.spotlight();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spotlight"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Article>>(
        future: articles,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return SpotlightWidget(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        }
      )
    );
  }
}
