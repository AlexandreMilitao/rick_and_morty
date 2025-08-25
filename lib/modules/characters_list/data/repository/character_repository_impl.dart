import 'package:result_dart/result_dart.dart';
import 'package:rick_and_morty/modules/characters_list/domain/entity/character_entity.dart';
import 'package:rick_and_morty/modules/characters_list/data/datasource/character_datasource.dart';
import 'package:rick_and_morty/modules/characters_list/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDatasource datasource;

  CharacterRepositoryImpl(this.datasource);

  @override
  Future<Result<List<CharacterEntity>>> getCharacters(int page) async {
    try {
      final result = await datasource.getCharacters(page);
      final entities = result.map((m) => m.toEntity()).toList();
      return Success(entities);
    } catch (e) {
      return Failure(Exception("Failed to fetch characters: $e"));
    }
  }
}
