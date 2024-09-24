import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../features/home/presentation/screens/register_screen.dart';

class AppRoutes{

  static const initialRoute = "/";

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: initialRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterScreen();
        },
      ),

    ],
  );
}