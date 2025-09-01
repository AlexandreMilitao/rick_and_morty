import 'package:result_dart/result_dart.dart';
import 'package:rick_and_morty/features/characters_list/domain/entity/character_entity.dart';

abstract class CharacterRepository {
  Future<Result<CharacterApiResultEntity>> getCharacters(int page);
}
