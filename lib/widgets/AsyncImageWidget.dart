import 'package:app/util/Api.dart';
import 'package:app/views/Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AsyncImageWidget extends StatefulWidget {
  AsyncImageWidget({required this.imgUrl, this.detailsUrl});

  String imgUrl;
  String? detailsUrl;

  @override
  _AsyncImageWidgetState createState() => _AsyncImageWidgetState(
      imgUrl: imgUrl,
      detailsUrl: detailsUrl
  );
}

class _AsyncImageWidgetState extends State<AsyncImageWidget> {
  _AsyncImageWidgetState({required this.imgUrl, this.detailsUrl});

  late Future<Image?> image;

  final String imgUrl;
  final String? detailsUrl;

  @override
  void initState() {
    super.initState();
    image = Api.image(imgUrl);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Image?> (
      future: image,
      builder: (context, img) {
        if (img.hasData) {
          return GestureDetector(
            onTap: () {
              if (detailsUrl != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        Details(detailsUrl!)
                    )
                );
              }
            },
            child: img.data!,
          );
        } else if (img.hasError) {
          return Text(img.error.toString());
        } else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}
