import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../pages/home/home_page.dart";
import "../../pages/tamil_twin/tamil_twin_page.dart";
import "../../pages/chapter_0/chapter_0_page.dart";
import "../../pages/experiences/experiences_page.dart";

Page<void> _page(Widget child, GoRouterState state) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: "home",
      pageBuilder: (context, state) => _page(const HomePage(), state),
    ),
    GoRoute(
      path: "/experiences",
      name: "experiences",
      pageBuilder: (context, state) => _page(const ExperiencesPage(), state),
    ),
    GoRoute(
      path: "/tamil-twin",
      name: "tamilTwin",
      pageBuilder: (context, state) => _page(const TamilTwinPage(), state),
    ),
    GoRoute(
      path: "/chapter-0",
      name: "chapter0",
      pageBuilder: (context, state) => _page(const Chapter0Page(), state),
    ),
  ],
);
