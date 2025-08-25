import 'package:rick_and_morty/core/constants/api.dart';
import 'package:rick_and_morty/core/http_client/custom_http_client.dart';
import 'package:rick_and_morty/modules/characters_list/domain/models/character_model.dart';

class CharacterDatasource {
  CustomHttpClient client;
  CharacterDatasource(this.client);

  Future<List<CharacterModel>> getCharacters() async {
    String? page;
    try {
      final response = await client.get(
        Api.charactersListEndpoint,
        queryParameters: {"page": page},
      );

      // TODO Melhorar isso.(as List)
      final data = response['results'] as List;
      return data.map((json) => CharacterModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch characters: $e');
    }
  }
}
