import 'package:rick_and_morty/core/core_injector.dart';
import 'package:rick_and_morty/features/characters_list/character_injector.dart';

class AppInitializer {
  static Future<void> initializeDependencies() async {
    final coreDI = CoreInjector();
    coreDI.setupDependecyInjections();

    final characterDI = CharacterInjector();
    characterDI.setupDependencyInjections();
  }
}
