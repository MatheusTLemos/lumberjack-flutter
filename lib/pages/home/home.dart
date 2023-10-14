import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/widgets/appbar.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () => context.push('/page1'),
            child: const Text('Push page 1'),
          ),
          TextButton(
            onPressed: () => context.go('/page2'),
            child: const Text('Go to page 2'),
          ),
        ],
      ),
    );
  }
}
