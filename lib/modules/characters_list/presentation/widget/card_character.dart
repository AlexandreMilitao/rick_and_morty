import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/style/colors.dart';
import 'package:rick_and_morty/modules/characters_list/domain/entity/character_entity.dart';

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
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(character.image),
        ),
        title: Text(
          character.name,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        subtitle: Text(
          character.species,
          style: const TextStyle(color: Colors.white60),
        ),
      ),
    );
  }
}
