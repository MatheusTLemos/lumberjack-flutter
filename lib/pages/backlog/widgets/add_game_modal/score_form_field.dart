import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScoreFormField extends StatelessWidget {
  const ScoreFormField({
    super.key,
    required TextEditingController scoreController,
  }) : _scoreController = scoreController;

  final TextEditingController _scoreController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: _scoreController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.score,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.required;
        }
        final valueAsDouble = double.tryParse(value);
        if (valueAsDouble == null || valueAsDouble < 0 || valueAsDouble > 10) {
          return AppLocalizations.of(context)!.invalidScoreErrorMessage;
        }
        return null;
      },
    );
  }
}
