import 'package:flutter_boilerplate/models/game.dart';
import 'package:flutter_boilerplate/repositories/games_repository.dart';
import 'package:collection/collection.dart';

class GameService {
  Future<Game> addGame(Game game) async {
    return GamesRepository.addGame(game);
  }

  Future<Game?> getGame(String name) async {
    final gamesList = await GamesRepository.getAllGames();
    return gamesList.firstWhereOrNull((game) => game.name == name);
  }

  Future<List<Game>> getAllGames() async {
    return GamesRepository.getAllGames();
  }

  Future<Game> editGame(Game game) async {
    await GamesRepository.removeGame(game.name);
    return GamesRepository.addGame(game);
  }

  Future<void> removeGame(String name) async {
    await GamesRepository.removeGame(name);
  }
}
