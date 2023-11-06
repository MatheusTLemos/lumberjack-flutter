import 'package:flutter/material.dart';
import 'package:lumberjack/models/game.dart';
import 'package:lumberjack/pages/backlog/widgets/add_game_fab.dart';
import 'package:lumberjack/pages/backlog/widgets/add_game_modal/add_game_modal.dart';
import 'package:lumberjack/pages/backlog/widgets/games_list/games_list_view.dart';
import 'package:lumberjack/services/game_service.dart';
import 'package:lumberjack/shared/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:lumberjack/states/loading_state.dart';
import 'package:provider/provider.dart';

class Backlog extends StatefulWidget {
  const Backlog({super.key});

  @override
  State<Backlog> createState() => _BacklogState();
}

class _BacklogState extends State<Backlog> {
  late List<Game> _gamesList = [];

  Future<void> _getAllGames() async {
    GetIt.I<GameService>().getAllGames().then(
      (games) {
        setState(
          () {
            games.sort((a, b) => a.value.compareTo(b.value));
            _gamesList = games.reversed.toList();
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
    return Consumer<LoadingState>(builder: (context, loadingState, _) {
      return Stack(children: [
        Scaffold(
          appBar: const CustomAppbar(),
          body: GamesListView(
            gamesList: _gamesList,
            isLoading: loadingState.getIsLoading(),
          ),
          floatingActionButton: AddGameFab(
            onPress: () async {
              final added = await showDialog(
                context: context,
                builder: (_) => const AddGameModal(),
              );
              if (added != null && added) {
                loadingState.setIsLoading(true);
                await _getAllGames();
                loadingState.setIsLoading(false);
              }
            },
          ),
        ),
        if (loadingState.getIsLoading()) const LoadingOverlay(),
      ]);
    });
  }
}
