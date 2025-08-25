import 'package:result_dart/result_dart.dart';
import 'package:rick_and_morty/modules/characters_list/domain/models/character_model.dart';
import 'package:rick_and_morty/modules/characters_list/data/datasource/character_datasource.dart';

class CharacterRepository {
  final CharacterDatasource datasource;

  CharacterRepository(this.datasource);

  Future<Result<List<CharacterModel>>> getCharacters() async {
    try {
      final result = await datasource.getCharacters();
      return Success((result));
    } catch (e) {
      return Failure(Exception("Failed to fetch characters: $e"));
    }
  }
}
