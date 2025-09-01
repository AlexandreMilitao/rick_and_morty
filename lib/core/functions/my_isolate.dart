import 'dart:isolate';

import 'package:rick_and_morty/features/characters_list/data/models/character_model.dart';

void backgroundAdder(SendPort sendPort) async {
  List<CharacterModel> chracter = [];

  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  await for (final dynamic message in receivePort) {
    if (message is List<CharacterModel>) {
      chracter.addAll(message);
      for (final character in message) {
        await Future.delayed(Duration(seconds: 2));
        sendPort.send(character);
      }
    }
  }
}
