// Representa o modelo de dados que vem do Datasource
// Contem métodos de serialização e desserialização (toJson, fromJson)
// É um aponte entre o datasource e a entidade (domain)
import 'package:rick_and_morty/features/characters_list/domain/entity/character_entity.dart';

class CharacterModel extends CharacterEntity {
  CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.type,
    required super.gender,
    required super.origin,
    required super.location,
    required super.image,
    required super.episode,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: LocationModel.fromJson(json['origin']),
      location: LocationModel.fromJson(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode'].map((e) => e.toString())),
    );
  }

  CharacterEntity toEntity() {
    return CharacterEntity(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: (origin as LocationModel).toEntity(),
      location: (location as LocationModel).toEntity(),
      image: image,
      episode: episode,
    );
  }
}

class LocationModel extends LocationEntity {
  LocationModel({
    required super.name,
    required super.url,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      url: json['url'],
    );
  }

  LocationEntity toEntity() {
    return LocationEntity(
      name: name,
      url: url,
    );
  }
}

class InfoModel extends InfoEntity {
  InfoModel({
    required super.itemCount,
    required super.pages,
    super.next,
    super.prev,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      itemCount: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }

  InfoEntity toEntity() {
    return InfoEntity(
      itemCount: itemCount,
      pages: pages,
      next: next,
      prev: prev,
    );
  }
}

class CharacterApiResultModel extends CharacterApiResultEntity {
  CharacterApiResultModel({
    required super.infoEntity,
    required super.results,
  });

  factory CharacterApiResultModel.fromJson(Map<String, dynamic> json) {
    return CharacterApiResultModel(
      infoEntity: InfoModel.fromJson(json['info']).toEntity(),
      results: List<CharacterEntity>.from(
        json['results'].map((e) => CharacterModel.fromJson(e).toEntity()),
      ),
    );
  }
  CharacterApiResultModel copyWith({
    InfoModel? infoEntity,
    List<CharacterModel>? results,
  }) {
    return CharacterApiResultModel(
      infoEntity: infoEntity ?? this.infoEntity as InfoModel,
      results: results ?? this.results.map((e) => e as CharacterModel).toList(),
    );
  }

  CharacterApiResultModel toEntity() {
    return CharacterApiResultModel(
      infoEntity: (infoEntity as InfoModel).toEntity(),
      results: results.map((e) => (e as CharacterModel).toEntity()).toList(),
    );
  }
}
