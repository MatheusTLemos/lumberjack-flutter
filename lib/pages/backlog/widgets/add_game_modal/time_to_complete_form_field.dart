import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimeToCompleteFormField extends StatelessWidget {
  const TimeToCompleteFormField({
    super.key,
    required TextEditingController timeToCompleteController,
  }) : _timeToCompleteController = timeToCompleteController;

  final TextEditingController _timeToCompleteController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: _timeToCompleteController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.timeToComplete,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.required;
        }
        final valueAsInt = int.tryParse(value);
        if (valueAsInt == null || valueAsInt <= 0) {
          return AppLocalizations.of(context)!
              .invalidTimeToCompleteErrorMessage;
        }
        return null;
      },
    );
  }
}
