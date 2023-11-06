import 'package:flutter/material.dart';
import 'package:lumberjack/models/game.dart';
import 'package:lumberjack/pages/backlog/widgets/games_list/game_list_view_item.dart';
import 'package:lumberjack/shared/constants.dart';

class GamesListView extends StatelessWidget {
  const GamesListView({
    required this.isLoading,
    required this.gamesList,
    super.key,
  });

  final bool isLoading;
  final List<Game> gamesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kSpacingMedium,
      ),
      child: ListView.separated(
        separatorBuilder: (_, __) => const Divider(
          color: Colors.grey,
          height: 1,
        ),
        itemCount: gamesList.length,
        itemBuilder: (_, index) => GameListViewItem(
          game: gamesList.elementAt(index),
        ),
      ),
    );
  }
}
