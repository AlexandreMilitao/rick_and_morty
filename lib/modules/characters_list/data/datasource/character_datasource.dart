import 'package:rick_and_morty/core/constants/api.dart';
import 'package:rick_and_morty/core/http_client/custom_http_client.dart';
import 'package:rick_and_morty/modules/characters_list/data/models/character_model.dart';

class CharacterDatasource {
  CustomHttpClient client;
  CharacterDatasource(this.client);

  Future<CharacterApiResultModel> getCharacters(int page) async {
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
