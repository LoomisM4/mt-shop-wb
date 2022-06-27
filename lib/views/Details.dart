import 'package:app/objects/gen/Article.dart';
import 'package:app/objects/CartObj.dart';
import 'package:app/util/Api.dart';
import 'package:app/widgets/AsyncImageWidget.dart';
import 'package:app/widgets/HorizontalScroller.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget { // 1
  const Details(this.url, {Key? key}) : super(key: key); // 4

  final String url; // 0

  @override // 1
  _DetailsState createState() => _DetailsState(url); // 2
}

class _DetailsState extends State<Details> { // 1
  _DetailsState(this.url); // 2

  late Future<Article?> article; // 0

  String url; // 0

  @override // 1
  void initState() { // 1
    super.initState(); // 1
    article = Api.details(url); // 2
  }

  @override // 1
  Widget build(BuildContext context) { // 1
    return Scaffold( // 2
      appBar: AppBar( // 2
        title: const Text("Details"), // 2
        backgroundColor: Colors.white, // 2
        foregroundColor: Colors.black, // 2
      ),
      body: FutureBuilder<Article?> ( // 2
        future: article, // 1
        builder: (context, a) { // 1
          if (a.hasData) { // 2
            return Column( // 2
              children: [ // 1
                HorizontalScroller( // 1
                  children: // 1
                    List.generate(a.data!.links?.images?.length ?? 0, (i) { // 6
                      return AsyncImageWidget(imgUrl: a.data!.links!.images![i].href); // 6
                    })
                ),
                ElevatedButton( // 1
                  onPressed: () { // 1
                    CartObj().add(a.data!); // 3
                  },
                  child: const Text("In den Warenkorb") // 2
                ),
                Text(a.data!.name ?? "", style: const TextStyle(fontSize: 20)), // 7
                Text(a.data!.description ?? ""), // 4
              ],
            );
          } else if (a.hasError) { // 2
            return Text(a.error.toString()); // 4
          } else { // 1
            return const CircularProgressIndicator(); // 2
          }
        }
      ),
    );
  }
}

// 78
