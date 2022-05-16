import 'package:app/objects/Article.dart';
import 'package:app/objects/CartObj.dart';
import 'package:app/util/Api.dart';
import 'package:app/widgets/AsyncImageWidget.dart';
import 'package:app/widgets/HorizontalScroller.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details(this.url, {Key? key}) : super(key: key);

  final String url;

  @override
  _DetailsState createState() => _DetailsState(url);
}

class _DetailsState extends State<Details> {
  _DetailsState(this.url);

  late Future<Article?> article;

  String url;

  @override
  void initState() {
    super.initState();
    article = Api.details(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<Article?> (
        future: article,
        builder: (context, a) {
          if (a.hasData) {
            return Column(
              children: [
                HorizontalScroller(
                  children:
                    List.generate(a.data!.links?.images?.length ?? 0, (i) {
                      return AsyncImageWidget(imgUrl: a.data!.links!.images![i].href);
                    })
                ),
                ElevatedButton(
                  onPressed: () {
                    CartObj().add(a.data!);
                  },
                  child: const Text("In den Warenkorb")
                ),
                Text(a.data!.name ?? "", style: const TextStyle(fontSize: 20)),
                Text(a.data!.description ?? ""),
              ],
            );
          } else if (a.hasError) {
            return Text(a.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        }
      ),
    );
  }
}
