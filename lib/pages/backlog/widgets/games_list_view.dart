import 'package:flutter/material.dart';
import 'package:lumberjack/models/game.dart';
import 'package:lumberjack/pages/backlog/widgets/game_list_view_item.dart';
import 'package:lumberjack/shared/constants/constants.dart';

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
    if (isLoading) {
      //TODO create a loading overlay
      return const Text('loading...');
    }
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
