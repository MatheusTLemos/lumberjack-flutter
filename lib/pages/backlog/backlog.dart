import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/models/game.dart';
import 'package:flutter_boilerplate/pages/backlog/widgets/add_game_fab.dart';
import 'package:flutter_boilerplate/pages/backlog/widgets/games_list_view.dart';
import 'package:flutter_boilerplate/services/game_service.dart';
import 'package:flutter_boilerplate/shared/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class Backlog extends StatefulWidget {
  const Backlog({super.key});

  @override
  State<Backlog> createState() => _BacklogState();
}

class _BacklogState extends State<Backlog> {
  late List<Game> gamesList = [];
  late bool isLoading = true;

  @override
  void initState() {
    GetIt.I<GameService>().getAllGames().then((value) {
      gamesList = value;
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: GamesListView(
        gamesList: gamesList,
        isLoading: isLoading,
      ),
      floatingActionButton: AddGameFab(
        onPress: () {
          GetIt.I<GameService>()
              .addGame(
            Game(
              name: 'Game',
              score: 10,
              addedAt: DateTime.now(),
              estimatedCompletionTime: 100,
            ),
          )
              .then((addedGame) {
            gamesList.add(addedGame);
            setState(() {});
          });
        },
      ),
    );
  }
}
