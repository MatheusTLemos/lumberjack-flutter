import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: _nameController,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.name,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.required;
        }
        return null;
      },
    );
  }
}
