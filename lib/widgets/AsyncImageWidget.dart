import 'package:flutter/widgets.dart';

class AsyncImageWidget extends StatefulWidget {
  AsyncImageWidget(this.url);

  String url;

  @override
  _AsyncImageWidgetState createState() => _AsyncImageWidgetState(url);
}

class _AsyncImageWidgetState extends State<AsyncImageWidget> {
  _AsyncImageWidgetState(this.url);

  final String url;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(url);
  }
}
