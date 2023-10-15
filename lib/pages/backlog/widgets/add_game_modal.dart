import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lumberjack/models/game.dart';
import 'package:lumberjack/services/game_service.dart';
import 'package:lumberjack/shared/constants/spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddGameModal extends StatefulWidget {
  const AddGameModal({super.key});

  @override
  State<AddGameModal> createState() => _AddGameModalState();
}

class _AddGameModalState extends State<AddGameModal> {
  //TODO add loading overlay
  late bool isLoading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController scoreController = TextEditingController();
  final TextEditingController timeToCompleteController =
      TextEditingController();

  Future<void> _createNewGame() async {
    setState(() {
      isLoading = true;
    });
    await GetIt.I<GameService>().addGame(Game(
      name: nameController.text,
      score: double.parse(scoreController.text),
      estimatedCompletionTime: double.parse(timeToCompleteController.text),
      addedAt: DateTime.now(),
    ));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacingLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              maxLines: 1,
              controller: nameController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.name,
              ),
            ),
            const SizedBox(
              height: kSpacingSmall,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextFormField(
                    maxLines: 1,
                    controller: scoreController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.score,
                    ),
                  ),
                ),
                const SizedBox(
                  width: kSpacingSmall,
                ),
                Expanded(
                  child: TextFormField(
                    maxLines: 1,
                    controller: timeToCompleteController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.timeToComplete,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: kSpacingLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    AppLocalizations.of(context)!.cancel,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _createNewGame()
                        .then((_) => Navigator.of(context).pop(true));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.save,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
