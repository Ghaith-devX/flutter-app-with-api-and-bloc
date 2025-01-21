import 'package:flutter/material.dart';
import 'package:news_app/constants/my_color.dart';

Widget customText({required String text, bool isTitle = true}) {
  return Text(text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: isTitle ? 'font' : 'font-Regular',
          fontSize: isTitle ? 18 : 13,
          fontWeight: isTitle ? FontWeight.normal : FontWeight.w600,
          color: isTitle ? MyColor().fontColor : MyColor().subTitleColor));
}
