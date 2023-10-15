import 'package:flutter/material.dart';
import 'package:lumberjack/models/game.dart';
import 'package:lumberjack/pages/backlog/widgets/add_game_fab.dart';
import 'package:lumberjack/pages/backlog/widgets/add_game_modal.dart';
import 'package:lumberjack/pages/backlog/widgets/games_list_view.dart';
import 'package:lumberjack/services/game_service.dart';
import 'package:lumberjack/shared/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class Backlog extends StatefulWidget {
  const Backlog({super.key});

  @override
  State<Backlog> createState() => _BacklogState();
}

class _BacklogState extends State<Backlog> {
  late List<Game> gamesList = [];
  late bool isLoading = true;

  Future<void> _getAllGames() async {
    setState(() {
      isLoading = true;
    });
    GetIt.I<GameService>().getAllGames().then(
      (games) {
        setState(
          () {
            games.sort((a, b) => a.value.compareTo(b.value));
            gamesList = games.reversed.toList();
            isLoading = false;
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getAllGames();
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
        onPress: () async {
          final added = await showDialog(
            context: context,
            builder: (_) => const AddGameModal(),
          );
          if (added != null && added) {
            await _getAllGames();
          }
        },
      ),
    );
  }
}
