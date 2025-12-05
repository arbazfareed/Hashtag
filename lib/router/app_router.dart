// router/app_router.dart
import 'package:go_router/go_router.dart';
import '../screens/screen_a.dart';
import '../screens/screen_b.dart';
import '../screens/screen_c.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const ScreenA(),
    ),
    GoRoute(
      path: '/screenB',
      name: 'dashboard',
      builder: (context, state) {
        final data = state.extra as Map<String, String>?;
        return ScreenB(
          phrase: data?['phrase'],
          hashtags: data?['hashtags'],
        );
      },
    ),
    GoRoute(
      path: '/screenC',
      name: 'create',
      builder: (context, state) => const ScreenC(),
    ),
  ],
);