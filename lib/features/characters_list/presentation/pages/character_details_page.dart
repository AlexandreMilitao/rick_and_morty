import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/animations/slide_fade_in_animations.dart';
import 'package:rick_and_morty/core/style/my_colors.dart';
import 'package:rick_and_morty/core/widgets/my_app_bar.dart';
import 'package:rick_and_morty/core/widgets/my_image.dart';
import 'package:rick_and_morty/core/widgets/my_scaffold.dart';
import 'package:rick_and_morty/features/characters_list/domain/entity/character_entity.dart';

class CharacterDetailsPage extends StatelessWidget {
  final CharacterEntity character;
  const CharacterDetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: MyAppBar(
        title: Text(
          character.name,
          style: TextStyle(
            color: MyColors.titleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: BackButton(
          onPressed: () => context.go('/charactersList'),
          color: MyColors.color5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlideFadeInAnimations(
              duration: Duration(seconds: 1),
              startOffSetX: -300,
              child: MyImage(imageUrl: character.image, width: 100),
            ),
            Text(character.status),
            Text(character.species),
            Text(character.gender),
            Text(character.location.name),
            Text(character.origin.name),
          ],
        ),
      ),
    );
  }
}
