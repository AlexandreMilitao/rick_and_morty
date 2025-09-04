// Gerencia o estado da tela
// Faz chamadas para o usecase e emite os estados para a UI reagir

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters_list/domain/usecases/get_characters_usecase.dart';
import 'package:rick_and_morty/features/characters_list/presentation/cubit/character_states.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final GetCharactersUseCase getCharacters;
  CharacterCubit({required this.getCharacters}) : super(CharacterInitial());

  int currentPage = 1;

  Future<void> fetchCharacters({int page = 1}) async {
    emit(CharacterLoading());

    final result = await getCharacters(page);
    result.fold(
      (s) => emit(CharacterSuccess(s)),
      (f) => emit(CharacterError(f.toString())),
    );
  }

  void nextPage() {
    fetchCharacters(page: currentPage + 1);
  }
}
