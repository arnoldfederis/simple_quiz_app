import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_quiz_app/app/pages.dart';
import 'package:simple_quiz_app/configs/configs.dart';
import 'package:simple_quiz_app/utils/utils.dart';

final router = GoRouter(
  initialLocation: RoutePath.dashboard,
  routes: [
    GoRoute(
      path: RoutePath.home,
      name: RouteName.home,
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
      path: RoutePath.dashboard,
      name: RouteName.dashboard,
      builder: (_, __) => const DashboardPage(),
      redirect: (
        BuildContext context,
        GoRouterState state,
      ) {
        final isAuthenticated = context.userState.isAuthenticated;

        if (!isAuthenticated) {
          return RoutePath.home;
        }
        
        return null;
      },
      routes: [
        GoRoute(
          path: RoutePath.quiz,
          name: RouteName.quiz,
          builder: (_, state) => QuizPage(
            category: state.pathParameters['category']!,
          ),
        ),
      ],
    ),
  ],
);
