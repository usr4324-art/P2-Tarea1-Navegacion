
import 'package:go_router/go_router.dart';

import 'welcome_page.dart';
import 'portfolio_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/portfolio',
      builder: (context, state) => const PortfolioPage(),
    ),
  ],
);
