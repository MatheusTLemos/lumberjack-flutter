import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lumberjack/models/game.dart';
import 'package:lumberjack/pages/backlog/widgets/add_game_modal/cancel_button.dart';
import 'package:lumberjack/pages/backlog/widgets/add_game_modal/name_form_field.dart';
import 'package:lumberjack/pages/backlog/widgets/add_game_modal/score_form_field.dart';
import 'package:lumberjack/pages/backlog/widgets/add_game_modal/time_to_complete_form_field.dart';
import 'package:lumberjack/services/game_service.dart';
import 'package:lumberjack/shared/constants/spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddGameModal extends StatefulWidget {
  const AddGameModal({super.key});

  @override
  State<AddGameModal> createState() => _AddGameModalState();
}

class _AddGameModalState extends State<AddGameModal> {
  late bool _isLoading = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();
  final TextEditingController _timeToCompleteController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _createNewGame() async {
    setState(() {
      _isLoading = true;
    });
    await GetIt.I<GameService>().addGame(Game(
      name: _nameController.text,
      score: double.parse(_scoreController.text),
      estimatedCompletionTime: double.parse(_timeToCompleteController.text),
      addedAt: DateTime.now(),
    ));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          child: Opacity(
            opacity: _isLoading ? 0 : 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpacingLarge),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NameFormField(nameController: _nameController),
                    const SizedBox(
                      height: kSpacingSmall,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child:
                              ScoreFormField(scoreController: _scoreController),
                        ),
                        const SizedBox(
                          width: kSpacingSmall,
                        ),
                        Expanded(
                          child: TimeToCompleteFormField(
                              timeToCompleteController:
                                  _timeToCompleteController),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: kSpacingLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const CancelButton(),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _createNewGame()
                                  .then((_) => Navigator.of(context).pop(true));
                            }
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
            ),
          ),
        ),
        if (_isLoading)
          Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
      ],
    );
  }
}
