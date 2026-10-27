
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'welcome_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/portfolio',
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('Portfolio screen'),
        ),
      ),
    ),
  ],
);
