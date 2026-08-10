import "package:flutter/material.dart";
import "core/routing/app_router.dart";
import "core/theme/app_theme.dart";

void main() {
  runApp(const TamilSocialClubApp());
}

class TamilSocialClubApp extends StatelessWidget {
  const TamilSocialClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Tamil Social Club Bengaluru",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
