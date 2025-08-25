import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/modules/characters_list/domain/models/character_model.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();
  @override
  List<Object?> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterSuccess extends CharacterState {
  final List<CharacterModel> characters;

  const CharacterSuccess(this.characters);
}

class CharacterError extends CharacterState {
  final String message;

  const CharacterError(this.message);
}
