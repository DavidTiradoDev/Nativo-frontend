import 'package:go_router/go_router.dart';
import 'package:nativo_front/modules/sync/sync_injection.dart';
import 'package:nativo_front/modules/login/auth_injection.dart';
import 'package:nativo_front/modules/campesino/campesino_home/campesino_home_injection.dart';
import 'package:nativo_front/modules/campesino/campesino_register/campesino_register_injection.dart';
import 'package:nativo_front/modules/comprador/comprador_home/comprador_home_injection.dart';
import 'package:nativo_front/modules/comprador/comprador_register/comprador_register_injection.dart';

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

    // Rutas Comprador
    GoRoute(
      path: '/comprador-register',
      builder: (context, state) => CompradorRegisterInjection.injection(),
    ),
    GoRoute(
      path: '/comprador-home',
      builder: (context, state) => CompradorHomeInjection.injection(),
    ),

    // Rutas Campesino
    GoRoute(
      path: '/campesino-register',
      builder: (context, state) => CampesinoRegisterInjection.injection(),
    ),
    GoRoute(
      path: '/campesino-home',
      builder: (context, state) => CampesinoHomeInjection.injection(),
    ),
  ],
);
