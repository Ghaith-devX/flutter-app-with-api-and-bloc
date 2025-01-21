import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/character_cubit.dart';
import 'package:news_app/business_logic/cubit/character_state.dart';

class ImageCharacter extends StatelessWidget {
  const ImageCharacter({required this.imageUrl, super.key});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: 150,
        decoration: BoxDecoration(border: Border.all(width: 0.5)),
        child: BlocBuilder<CharactersCubit, CharactersState>(
            builder: (context, state) {
          if (state is CharactersLoading) {
            return Image.asset('assets/images/loading.gif');
          }
          return Image.network(imageUrl, fit: BoxFit.cover);
        }));
  }
}
