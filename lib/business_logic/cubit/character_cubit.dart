import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/character_state.dart';
import 'package:news_app/data/model/character.dart';
import 'package:news_app/data/repository/character_repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  List<Characters> characters = [];
  List<Characters> searchResults = [];

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  Future<void> getAllCharacters() async {
    try {
      emit(CharactersLoading());
      characters = await characterRepository.getAllCharacters();
      emit(CharactersLoaded(characters));
    } catch (e) {
      emit(CharactersError(e.toString()));
    }
  }

  void searchCharacters(String searchTerm) {
    if (searchTerm.isEmpty) {
      emit(CharactersLoaded(characters));
      return;
    }
    searchResults = characters.where(
      (character) {
        return character.fullName
                .toLowerCase()
                .contains(searchTerm.toLowerCase()) ||
            character.title.toLowerCase().contains(searchTerm.toLowerCase()) ||
            character.family.toLowerCase().contains(searchTerm.toLowerCase());
      },
    ).toList();
    emit(CharactersLoaded(searchResults));
  }
}
