import 'package:go_router/go_router.dart';
import 'package:nativo_front/modules/auth/auth_injection.dart';
import 'package:nativo_front/modules/sync/sync_injection.dart';

final router = GoRouter(
  initialLocation: '/sync',
  routes: [
    // Rutas Generales
    GoRoute(
      path: '/sync',
      builder: (context, state) => SyncInjection.injection(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => AuthInjection.injection(),
    ),

    // Rutas Usuario

    // Rutas Campesino
  ],
);
