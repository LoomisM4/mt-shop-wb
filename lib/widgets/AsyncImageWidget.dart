import 'package:app/util/Api.dart';
import 'package:app/views/Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AsyncImageWidget extends StatefulWidget { // 1
  AsyncImageWidget({required this.imgUrl, this.detailsUrl}); // 3

  String imgUrl; // 0
  String? detailsUrl; // 0

  @override // 1
  _AsyncImageWidgetState createState() => _AsyncImageWidgetState( // 2
      imgUrl: imgUrl, // 1
      detailsUrl: detailsUrl // 1
  );
}

class _AsyncImageWidgetState extends State<AsyncImageWidget> { // 1
  _AsyncImageWidgetState({required this.imgUrl, this.detailsUrl}); // 3

  late Future<Image?> image; // 0

  final String imgUrl; // 0
  final String? detailsUrl; // 0

  @override // 1
  void initState() { // 1
    super.initState(); // 1
    image = Api.image(imgUrl); // 2
  }

  @override // 1
  Widget build(BuildContext context) { // 1
    return FutureBuilder<Image?> ( // 2
      future: image, // 1
      builder: (context, img) { // 1
        if (img.hasData) { // 2
          return GestureDetector( // 2
            onTap: () { // 1
              if (detailsUrl != null) { // 2
                Navigator.push( // 1
                    context,
                    MaterialPageRoute(builder: (context) => // 2
                        Details(detailsUrl!) // 1
                    )
                );
              }
            },
            child: img.data!, // 2
          );
        } else if (img.hasError) { // 2
          return Text(img.error.toString()); // 4
        } else { // 1
          return const CircularProgressIndicator(); // 2
        }
      }
    );
  }
}

// 46
