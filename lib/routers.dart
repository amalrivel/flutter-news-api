import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project_2/models/news.dart';
import 'package:mini_project_2/views/detail_screen.dart';
import 'package:mini_project_2/views/home_screen.dart';

class Routers {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'details',
            name: 'details',
            builder: (BuildContext context, GoRouterState state) {
              NewsModel news = state.extra as NewsModel;
              return DetailScreen(
                object: news
              );
            },
          ),
        ],
      ),
    ],
  );
}
