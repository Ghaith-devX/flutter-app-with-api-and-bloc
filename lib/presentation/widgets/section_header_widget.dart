import 'package:flutter/material.dart';
import 'package:news_app/constants/my_color.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text,
            style: TextStyle(
                fontFamily: 'font',
                color: MyColor().primaryColor,
                fontSize: 18)),
      ],
    );
  }
}
