import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/widgets/initial_page.dart';
import 'package:rick_and_morty/modules/characters_list/presentation/pages/character_list_page.dart';

class AppRoutes {
  static const String initial = "/";
  static const String characterList = '/charactersList';
  static const String characterDetail = '/characters/:id';

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
      ],
      errorBuilder: (context, state) {
        return Scaffold(body: Center(child: Text('Page not found')));
      },
    );
  }
}
