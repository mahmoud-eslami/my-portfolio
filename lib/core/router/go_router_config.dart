import 'package:flutter/material.dart';
import 'package:flutter_portfolio/features/home/ui/image_preview/image_preview_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/model/home_model.dart';
import '../../features/home/ui/home/home_screen.dart';

final router = GoRouter(
  initialLocation: "/",
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SelectionArea(
        child: HomeScreen(),
      ),
    ),
    GoRoute(
        path: ImagePreviewScreen.path,
        builder: (context, state) {
          Projects project = state.extra as Projects;
          return ImagePreviewScreen(
            project: project,
          );
        }),
  ],
);
