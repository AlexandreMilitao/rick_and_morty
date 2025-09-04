// Configuracão das dependencias do módulo(Character)
// Registra datasources, repositorios usecas e cubits no container da injeção de dependencia(GetIt)

import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/http_client/custom_http_client.dart';
import 'package:rick_and_morty/features/characters_list/data/datasource/character_datasource.dart';
import 'package:rick_and_morty/features/characters_list/data/repository/character_repository_impl.dart';
import 'package:rick_and_morty/features/characters_list/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/features/characters_list/domain/usecases/get_characters_usecase.dart';
import 'package:rick_and_morty/features/characters_list/presentation/cubit/character_cubit.dart';

class CharacterInjector {
  final GetIt getIt = GetIt.instance;

  void setupDependencyInjections() {
    getIt.registerSingleton<CharacterDatasource>(
      CharacterDatasource(getIt<CustomHttpClient>()),
    );

    getIt.registerSingleton<CharacterRepository>(
      CharacterRepositoryImpl(getIt<CharacterDatasource>()),
    );

    getIt.registerSingleton<GetCharactersUseCase>(
      GetCharactersUseCase(getIt<CharacterRepository>()),
    );

    getIt.registerSingleton<CharacterCubit>(
      CharacterCubit(getCharacters: getIt<GetCharactersUseCase>()),
    );
  }
}
