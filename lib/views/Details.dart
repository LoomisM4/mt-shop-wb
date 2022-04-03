import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details(this.url, {Key? key}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const Text("TODO"),
    );
  }
}
