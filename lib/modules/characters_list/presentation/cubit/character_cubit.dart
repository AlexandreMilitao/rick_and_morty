import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/modules/characters_list/data/repository/character_repo.dart';
import 'package:rick_and_morty/modules/characters_list/presentation/cubit/character_states.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository repository;
  CharacterCubit({required this.repository}) : super(CharacterInitial());

  Future<void> fetchCharacters() async {
    emit(CharacterLoading());

    final result = await repository.getCharacters();
    result.fold(
      (s) => emit(CharacterSuccess(s)),
      (f) => emit(CharacterError(f.toString())),
    );
  }
}
