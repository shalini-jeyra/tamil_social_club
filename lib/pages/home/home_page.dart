import "package:flutter/material.dart";
import "../../widgets/navigation/app_footer.dart";
import "../../widgets/navigation/app_header.dart";
import "widgets/about_section.dart";
import "widgets/chapter0_teaser_section.dart";
import "widgets/community_section.dart";
import "widgets/hero_section.dart";
import "widgets/instagram_section.dart";
import "widgets/tamil_twin_teaser_section.dart";

/// Route: "/" — the site's home. Sections map 1:1 to PRD section 5–17.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            TamilTwinTeaserSection(),
            Chapter0TeaserSection(),
            CommunitySection(),
            AboutSection(),
            InstagramSection(),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
