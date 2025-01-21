import 'package:news_app/data/model/character.dart';
import 'package:news_app/data/web_services/character_web_services.dart';

class CharacterRepository {
  final CharacterWebServices characterWebServices;

  CharacterRepository(this.characterWebServices);

  Future<List<Characters>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();
    return characters
        .map((character) => Characters.fromJson(character))
        .toList();
  }
}
