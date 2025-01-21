import 'package:flutter/material.dart';
import 'package:news_app/constants/my_color.dart';
import 'package:news_app/presentation/screen/home_screen/widgets_home_screen/image_character.dart';

import 'widget_custom_text.dart';

class CharactersCards extends StatelessWidget {
  final String title;
  final String fName;
  final String familyl;
  final String imageUrl;
  const CharactersCards(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.fName,
      required this.familyl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              color: MyColor().primaryColor,
              border: Border.all(color: MyColor().grey, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(text: title),
                        const SizedBox(height: 5),
                        customText(text: fName, isTitle: false),
                        const SizedBox(height: 5),
                        customText(text: familyl, isTitle: false),
                      ]),
                ),
                Expanded(flex: 1, child: ImageCharacter(imageUrl: imageUrl)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
