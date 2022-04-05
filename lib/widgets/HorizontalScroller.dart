import 'package:app/widgets/AsyncImageWidget.dart';
import 'package:flutter/widgets.dart';

class HorizontalScroller extends StatelessWidget {
  HorizontalScroller({Key? key, required this.children}) : super(key: key);

  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: children,
        shrinkWrap: true,
      ),
    );
  }
}
