// Cama responsavel por buscar os dados (API, banco local, etc)
import 'package:rick_and_morty/core/constants/api.dart';
import 'package:rick_and_morty/core/http_client/custom_http_client.dart';
import 'package:rick_and_morty/features/characters_list/data/models/character_model.dart';

class CharacterDatasource {
  CustomHttpClient client;
  // final asyncCharacterController = AsyncCharacterController();
  CharacterDatasource(this.client);

  Future<CharacterApiResultModel> getCharacters(int page) async {
    // await asyncCharacterController.start();
    try {
      final response = await client.get(
        Api.charactersListEndpoint,
        queryParameters: {"page": page.toString()},
      );

      return CharacterApiResultModel(
        infoEntity: InfoModel.fromJson(response['info']),
        results: List<CharacterModel>.from(
          response['results'].map((json) => CharacterModel.fromJson(json)),
        ),
      );
    } catch (e) {
      throw Exception('Failed to fetch characters: $e');
    }
  }
}
