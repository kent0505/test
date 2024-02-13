import 'package:go_router/go_router.dart';

import '../features/splash/splash_page.dart';
import '../features/auth/auth_page.dart';
import '../features/auth/terms_page.dart';
import '../features/home/home_page.dart';

GoRouter routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      path: '/terms',
      builder: (context, state) => const TermsPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
