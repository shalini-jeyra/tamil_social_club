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

    return AppBar(
      backgroundColor: AppColors.creamSoft.withOpacity(0.95),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 16,
      leading: isWide
          ? null
          : Builder(
              builder: (ctx) => IconButton(
                icon: const Icon(Icons.menu_rounded, color: AppColors.charcoal),
                onPressed: () => Scaffold.of(ctx).openDrawer(),
              ),
            ),
      title: InkWell(
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
                style: AppTextStyles.display(size: 15, weight: FontWeight.w600),
              ),
            ],
          ],
        ),
      ),
      actions: isWide
          ? [
              _NavLink("Experiences", "/experiences", location, context),
              _NavLink("Tamil Twin", "/tamil-twin", location, context),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 4),
                child: _joinButton(context),
              ),
            ]
          : [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _joinButton(context),
              ),
            ],
    );
  }

  Widget _joinButton(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.teal900,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      ),
      onPressed: () {
        AnalyticsService.track("whatsapp_clicked", {"from": "nav"});
        ShareService.openUrl(AppLinks.whatsapp);
      },
      child: Text(
        "Join",
        style: AppTextStyles.button(color: AppColors.cream).copyWith(fontSize: 13),
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
          color: _isActive ? AppColors.teal800 : AppColors.charcoal.withOpacity(0.75),
        ),
      ),
    );
  }
}
