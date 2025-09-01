import 'dart:isolate';

import 'package:rick_and_morty/core/functions/my_isolate.dart';
import 'package:rick_and_morty/features/characters_list/data/models/character_model.dart';

class AsyncCharacterController {
  late Isolate _isolate;
  late ReceivePort _receivePort;
  late SendPort _sendPort;

  bool _isRunning = false;

  Future<void> start() async {
    if (_isRunning) return;

    _isRunning = true;

    _receivePort = ReceivePort();

    _receivePort.listen((dynamic message) {
      if (message is SendPort) {
        _sendPort = message;
      } else if (message is CharacterModel) {
        print("Isolate - Novo character adicionado: ${message.name}");
      }
    });
    _isolate = await Isolate.spawn(backgroundAdder, _receivePort.sendPort);
  }

  void addCharacters(List<CharacterModel> characters) {
    _sendPort.send(characters);
  }

  void stop() {
    _isolate.kill(priority: Isolate.immediate);
    _receivePort.close();
    _isRunning = false;
  }
}

// Add this line on datasouce do run isolate
// final characterFromApi = (response['results'] as List<dynamic>)
// .map((json) => CharacterModel.fromJson(json))
// .toList();
// asyncCharacterController.addCharacters(characterFromApi);
