import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/pages/initial_page.dart';
import 'package:rick_and_morty/features/characters_list/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/characters_list/presentation/pages/character_details_page.dart';
import 'package:rick_and_morty/features/characters_list/presentation/pages/character_list_page.dart';

class AppRoutes {
  static const String initial = "/";
  static const String characterList = '/charactersList';
  static const String characterDetail = '/characters';

  static GoRouter get router {
    return GoRouter(
      initialLocation: initial,
      routes: [
        GoRoute(
          path: initial,
          name: "initial",
          builder: (context, state) => const InitialPage(),
        ),
        GoRoute(
          path: characterList,
          name: "charactersList",
          builder: (context, state) => CharacterListPage(),
        ),
        GoRoute(
          path: characterDetail,
          name: "characterDetail",
          builder: (context, state) =>
              CharacterDetailsPage(character: state.extra as CharacterEntity),
        ),
      ],
      errorBuilder: (context, state) {
        return Scaffold(body: Center(child: Text('Page not found')));
      },
    );
  }
}
