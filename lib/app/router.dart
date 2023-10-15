import 'package:flutter_boilerplate/pages/backlog/backlog.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Backlog(),
    ),
  ],
);
