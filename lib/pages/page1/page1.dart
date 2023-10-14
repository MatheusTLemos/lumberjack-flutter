import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/widgets/appbar.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Appbar(),
      body: Placeholder(
        child: Text('Page 1'),
      ),
    );
  }
}
