import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/http_client/custom_http_client.dart';
import 'package:rick_and_morty/modules/characters_list/data/datasource/character_datasource.dart';
import 'package:rick_and_morty/modules/characters_list/data/repository/character_repo.dart';
import 'package:rick_and_morty/modules/characters_list/presentation/cubit/character_cubit.dart';

class CharacterInjector {
  final GetIt getIt = GetIt.instance;

  void setupDependencyInjections() {
    getIt.registerSingleton<CharacterDatasource>(
      CharacterDatasource(getIt<CustomHttpClient>()),
    );

    getIt.registerSingleton<CharacterRepository>(
      CharacterRepository(getIt<CharacterDatasource>()),
    );

    getIt.registerSingleton<CharacterCubit>(
      CharacterCubit(repository: getIt<CharacterRepository>()),
    );
  }
}
