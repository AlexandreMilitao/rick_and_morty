import 'package:result_dart/result_dart.dart';
import 'package:rick_and_morty/features/characters_list/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/characters_list/data/datasource/character_datasource.dart';
import 'package:rick_and_morty/features/characters_list/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDatasource datasource;

  CharacterRepositoryImpl(this.datasource);

  @override
  Future<Result<CharacterApiResultEntity>> getCharacters(int page) async {
    try {
      final result = await datasource.getCharacters(page);

      return Success(result);
    } catch (e) {
      return Failure(Exception("Failed to fetch characters: $e"));
    }
  }
}
