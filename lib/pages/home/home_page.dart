import "package:flutter/material.dart";
import "../../widgets/navigation/app_drawer.dart";
import "../../widgets/navigation/app_footer.dart";
import "../../widgets/navigation/app_header.dart";
import "widgets/chapter0_teaser_section.dart";
import "widgets/community_section.dart";
import "widgets/experience_pillars_section.dart";
import "widgets/hero_section.dart";
import "widgets/instagram_section.dart";
import "widgets/problem_section.dart";
import "widgets/tamil_twin_teaser_section.dart";
import "widgets/what_tsc_is_section.dart";

/// Route: "/" — Homepage.
/// Section order follows PRD §6–11:
/// 1. Hero
/// 2. The Problem ("We should meet sometime")
/// 3. What TSC Is (NOT ANOTHER NETWORKING EVENT)
/// 4. Experience Pillars (PICK YOUR KIND OF WEEKEND)
/// 5. What's Happening / Chapter 0 Teaser
/// 6. Tamil Twin Teaser
/// 7. Community CTA
/// 8. Instagram CTA
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(),
      drawer: const AppDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            ProblemSection(),
            WhatTscIsSection(),
            ExperiencePillarsSection(),
            Chapter0TeaserSection(),
            TamilTwinTeaserSection(),
            CommunitySection(),
            InstagramSection(),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
