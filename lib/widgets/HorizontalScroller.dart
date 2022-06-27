import 'package:flutter/widgets.dart';

class HorizontalScroller extends StatelessWidget { // 1
  HorizontalScroller({Key? key, required this.children}) : super(key: key); // 4

  List<Widget> children; // 0

  @override // 1
  Widget build(BuildContext context) { // 1
    return Container( // 2
      height: MediaQuery.of(context).size.height * 0.55, // 5
      child: ListView( // 2
        scrollDirection: Axis.horizontal, // 2
        children: children, // 1
        shrinkWrap: true, // 1
      ),
    );
  }
}

// 20
