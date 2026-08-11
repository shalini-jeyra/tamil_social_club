import "package:flutter/material.dart";
import "../../widgets/navigation/app_drawer.dart";
import "../../widgets/navigation/app_footer.dart";
import "../../widgets/navigation/app_header.dart";
import "widgets/chapter0_teaser_section.dart";
import "widgets/come_alone_section.dart";
import "widgets/community_section.dart";
import "widgets/experience_pillars_section.dart";
import "widgets/hero_section.dart";
import "widgets/instagram_section.dart";
import "widgets/problem_section.dart";
import "widgets/tamil_twin_teaser_section.dart";

/// Route: "/" — Homepage.
///
/// Flow (redesign brief, Aug 2026):
/// 1. Hero
/// 2. Tamil Twin — the interactive hook, moved right after the hero
/// 3. "We should meet sometime." — the problem
/// 4. Chapter 0 — the actual thing happening, made dominant
/// 5. Experience pillars — what kind of weekend
/// 6. Come alone — the emotional core
/// 7. Community CTA — "So... are you coming?"
/// 8. Instagram strip
/// 9. Footer
///
/// The old "More than just networking" section was removed outright —
/// naming networking, even to deny it, still put networking in the
/// visitor's head.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppHeader(),
      drawer: const AppDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            TamilTwinTeaserSection(),
            ProblemSection(),
            Chapter0TeaserSection(),
            ExperiencePillarsSection(),
            ComeAloneSection(),
            CommunitySection(),
            InstagramStrip(),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
