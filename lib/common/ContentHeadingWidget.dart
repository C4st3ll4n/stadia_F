import 'package:flutter/material.dart';
import 'package:flutterstadia/styleguide/text_style.dart';

class ContentHeadingWidget extends StatelessWidget {

  final String heading;

  const ContentHeadingWidget({Key key, this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:20.0),
      child: Text(
        heading,
        style: kHeadingOneTextStyle,
      ),
    );
  }
}
