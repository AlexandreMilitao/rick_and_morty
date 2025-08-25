import 'package:result_dart/result_dart.dart';
import 'package:rick_and_morty/modules/characters_list/domain/models/character_entity.dart';

abstract class CharacterRepository {
  Future<Result<List<CharacterEntity>>> getCharacters(int page);
}
