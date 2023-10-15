import 'package:flutter/material.dart';

class AddGameFab extends StatelessWidget {
  const AddGameFab({
    required this.onPress,
    super.key,
  });

  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
