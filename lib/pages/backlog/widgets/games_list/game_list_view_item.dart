import 'package:flutter/material.dart';
import 'package:lumberjack/models/game.dart';
import 'package:lumberjack/shared/constants.dart';
import 'package:intl/intl.dart';

class GameListViewItem extends StatelessWidget {
  const GameListViewItem({
    required this.game,
    super.key,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kSpacingSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                game.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                DateFormat('dd/MM/yyyy').format(game.addedAt),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const Icon(
            Icons.chevron_right,
          ),
        ],
      ),
    );
  }
}
