import 'package:flutter_boilerplate/pages/home/home.dart';
import 'package:flutter_boilerplate/pages/page1/page1.dart';
import 'package:flutter_boilerplate/pages/page2/page2.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/page1',
      builder: (context, state) => const Page1(),
    ),
    GoRoute(
      path: '/page2',
      builder: (context, state) => const Page2(),
    ),
  ],
);
