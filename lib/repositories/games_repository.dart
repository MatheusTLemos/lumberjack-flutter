import 'dart:convert';
import 'package:flutter_boilerplate/models/game.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kGamesKey = 'GAMES';

class GamesRepository {
  static Future<Game> addGame(Game game) async {
    final List<Game> gamesList = await _getListOfGamesInStorage();
    gamesList.add(game);
    await _saveGamesListInStorage(gamesList);
    return game;
  }

  static Future<List<Game>> getAllGames() async {
    return _getListOfGamesInStorage();
  }

  static Future<void> removeGame(String name) async {
    final List<Game> gamesList = await _getListOfGamesInStorage();
    gamesList.removeWhere(
      (gameInList) => gameInList.name == name,
    );
    await _saveGamesListInStorage(gamesList);
  }

  static Future<void> _saveGamesListInStorage(List<Game> gamesList) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedList =
        gamesList.map((game) => jsonEncode(game.toMap())).toList();
    await prefs.setStringList(kGamesKey, encodedList);
  }

  static Future<List<Game>> _getListOfGamesInStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final gamesOnStorage = prefs.getStringList(kGamesKey);
    List<Game> gamesList = [];
    if (gamesOnStorage != null) {
      gamesList = gamesOnStorage
          .map((item) => Game.fromMap(json.decode(item)))
          .toList();
    }
    return gamesList;
  }
}
