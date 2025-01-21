import 'package:news_app/data/model/character.dart';

abstract class CharactersState {
  const CharactersState();
}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Characters> characters;
  const CharactersLoaded(this.characters);
}

class CharactersError extends CharactersState {
  final String message;
  const CharactersError(this.message);
}

class SearchCharactersNotEmpty extends CharactersState {}

class SearchCharactersIsEmpty extends CharactersState {}
