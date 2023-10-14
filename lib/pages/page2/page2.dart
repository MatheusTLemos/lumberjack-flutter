import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/widgets/appbar.dart';
import 'package:go_router/go_router.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      body: Placeholder(
        child: TextButton(
          onPressed: () => context.go('/'),
          child: const Text('Go to Home'),
        ),
      ),
    );
  }
}
