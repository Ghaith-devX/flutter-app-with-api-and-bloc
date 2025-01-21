import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/character_cubit.dart';
import 'package:news_app/business_logic/cubit/character_state.dart';
import 'package:news_app/constants/my_color.dart';
import 'package:news_app/presentation/screen/home_screen/widgets_home_screen/characters_cards.dart';

import '../../widgets/section_header_widget.dart';
import 'widgets_home_screen/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: MyColor().primaryColor,
          title: Text('Game of Thrones',
              textAlign: TextAlign.end,
              style:
                  TextStyle(fontFamily: 'font', color: MyColor().fontColor))),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeaderWidget(text: 'Search'),
            const SizedBox(height: 13),
            const SearchBarWidget(),
            const SizedBox(height: 13),
            const SectionHeaderWidget(text: 'Characters'),
            const SizedBox(height: 13),
            BlocBuilder<CharactersCubit, CharactersState>(
              builder: (context, state) {
                if (state is CharactersLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CharactersLoaded) {
                  final characters = state.characters;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: characters.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            CharactersCards(
                                imageUrl: characters[i].imageUrl,
                                title: characters[i].title,
                                fName: characters[i].fullName,
                                familyl: characters[i].family),
                            const SizedBox(height: 7)
                          ],
                        );
                      },
                    ),
                  );
                } else if (state is CharactersError) {
                  return Text('Error: ${state.message}');
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
