import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/widgets/my_image.dart';
import 'package:rick_and_morty/features/characters_list/domain/entity/character_entity.dart';

class CardCharacter extends StatelessWidget {
  final CharacterEntity character;
  const CardCharacter({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: MyImage(
          imageUrl: character.image,
        ),
        title: Text(
          character.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          character.species,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
