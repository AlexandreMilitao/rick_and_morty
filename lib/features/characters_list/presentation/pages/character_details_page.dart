import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/animations/slide_fade_in_animations.dart';
import 'package:rick_and_morty/core/constants/app_assets.dart';
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
        title: SvgPicture.asset(
          AppAssets.logo,
          height: 50,
        ),
        leading: BackButton(
          onPressed: () => context.go('/charactersList'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              character.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Center(
              child: SlideFadeInAnimations(
                duration: Duration(seconds: 1),
                startOffSetX: -300,
                child: MyImage(
                  imageUrl: character.image,
                  width: 100,
                ),
              ),
            ),

            Row(
              children: [
                Text(
                  "Status: ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  character.status,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Species: ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  character.species,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Gender: ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  character.gender,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Location: ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  character.location.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Origin: ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  character.origin.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
