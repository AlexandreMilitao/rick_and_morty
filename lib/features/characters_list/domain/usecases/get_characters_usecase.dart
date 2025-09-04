// Caso de uso responsavel por orquestrar a busca dos dados.
// Regras específicas de negócios são implementadas aqui

import 'package:result_dart/result_dart.dart';
import 'package:rick_and_morty/features/characters_list/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/characters_list/domain/repositories/character_repository.dart';

class GetCharactersUseCase {
  final CharacterRepository repository;

  GetCharactersUseCase(this.repository);

  Future<Result<CharacterApiResultEntity>> call(int page) async {
    return await repository.getCharacters(page);
  }
}
