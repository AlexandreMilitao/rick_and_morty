// Define os estados que a UI pode ter

import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/features/characters_list/domain/entity/character_entity.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();
  @override
  List<Object?> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterSuccess extends CharacterState {
  final CharacterApiResultEntity apiResult;

  const CharacterSuccess(this.apiResult);
}

class CharacterError extends CharacterState {
  final String message;

  const CharacterError(this.message);
}
