import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../core/constants/links.dart";
import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";
import "../../services/analytics_service.dart";
import "../../services/share_service.dart";

/// Sticky top nav per PRD §20.
/// Desktop: Logo | Experiences | Tamil Twin | [JOIN]
/// Mobile:  Logo + hamburger → drawer (AppDrawer)
class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 768;
    final location = GoRouterState.of(context).matchedLocation;

    return Container(
      height: 64,
      color: AppColors.teal900,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!isWide)
            IconButton(
              icon: const Icon(Icons.menu_rounded, color: AppColors.cream),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          
          // Logo
          InkWell(
            onTap: () => context.goNamed("home"),
            borderRadius: BorderRadius.circular(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 38,
                    width: 38,
                    fit: BoxFit.cover,
                  ),
                ),
                if (isWide) ...[
                  const SizedBox(width: 10),
                  Text(
                    "Tamil Social Club",
                    style: AppTextStyles.display(
                      size: 15,
                      weight: FontWeight.w600,
                      color: AppColors.cream,
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          if (isWide) ...[
            // Centered Nav Links
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _NavLink("Home", "/", location, context),
                  const SizedBox(width: 16),
                  _NavLink("Experiences", "/experiences", location, context),
                  const SizedBox(width: 16),
                  _NavLink("Tamil Twin", "/tamil-twin", location, context),
                  const SizedBox(width: 16),
                  _NavLink("Community", "/community", location, context),
                ],
              ),
            ),
            // Right CTA
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _joinButton(context),
            ),
          ] else ...[
            const Spacer(),
            // Right CTA Mobile
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: _joinButton(context),
            ),
          ],
        ],
      ),
    );
  }

  Widget _joinButton(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.gold,
        side: const BorderSide(color: AppColors.gold),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: () {
        AnalyticsService.track("whatsapp_clicked", {"from": "nav"});
        ShareService.openUrl(AppLinks.whatsapp);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Join the community", style: AppTextStyles.button(color: AppColors.cream).copyWith(fontSize: 13)),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.cream),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final String path;
  final String currentLocation;
  final BuildContext parentContext;

  const _NavLink(this.label, this.path, this.currentLocation, this.parentContext);

  bool get _isActive => currentLocation == path;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => parentContext.go(path),
      child: Text(
        label,
        style: AppTextStyles.body(
          size: 14,
          weight: _isActive ? FontWeight.w700 : FontWeight.w500,
          color: _isActive ? AppColors.gold : AppColors.cream.withOpacity(0.75),
        ),
      ),
    );
  }
}
