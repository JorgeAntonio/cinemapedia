import 'package:cinemapedia/config/router/routes_config.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: Routes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
