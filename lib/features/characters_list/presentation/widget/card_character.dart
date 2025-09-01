import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/style/my_colors.dart';
import 'package:rick_and_morty/core/widgets/my_image.dart';
import 'package:rick_and_morty/features/characters_list/domain/entity/character_entity.dart';

class CardCharacter extends StatelessWidget {
  final CharacterEntity character;
  const CardCharacter({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.color1,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        leading: MyImage(
          imageUrl: character.image,
        ),
        title: Text(
          character.name,
          style: TextStyle(color: MyColors.titleColor, fontSize: 18),
        ),
        subtitle: Text(
          character.species,
          style: TextStyle(color: MyColors.subtitleColor),
        ),
      ),
    );
  }
}
