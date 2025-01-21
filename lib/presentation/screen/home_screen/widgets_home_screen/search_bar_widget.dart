import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/character_cubit.dart';
import 'package:news_app/constants/my_color.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        onChanged: (searchTerm) {
          context.read<CharactersCubit>().searchCharacters(searchTerm);
        },
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            fillColor: MyColor().grey,
            filled: true,
            hintText: 'Search for a character',
            hintStyle:
                TextStyle(fontFamily: 'font', color: MyColor().primaryColor),
            suffixIcon: Icon(
              size: 30,
              Icons.search,
              color: MyColor().primaryColor,
            )),
      ),
    );
  }
}
