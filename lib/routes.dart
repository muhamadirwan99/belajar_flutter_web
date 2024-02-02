import 'package:belajar_flutter_web/core.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const BerandaView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'camera',
          builder: (BuildContext context, GoRouterState state) {
            List<CameraDescription> cameras =
                state.extra as List<CameraDescription>;
            return CameraPageView(
              cameras: cameras,
            );
          },
        ),
        GoRoute(
          path: 'geolocation',
          builder: (BuildContext context, GoRouterState state) {
            return const GeolocationView();
          },
        ),
        GoRoute(
          path: 'websocketpage',
          builder: (BuildContext context, GoRouterState state) {
            return const WebSocketView();
          },
        ),
        GoRoute(
          path: 'printpdfpage',
          builder: (BuildContext context, GoRouterState state) {
            return const PrintPageView();
          },
        ),
      ],
    ),
  ],
);
