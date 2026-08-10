import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../core/constants/links.dart";
import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";
import "../../services/analytics_service.dart";
import "../../services/share_service.dart";

/// Sticky top nav shown on Home and Chapter 0 (not on the immersive
/// Tamil Twin flow, which owns the full screen instead).
class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 768;
    return AppBar(
      backgroundColor: AppColors.creamSoft.withOpacity(0.92),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 16,
      title: InkWell(
        onTap: () => context.goNamed("home"),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Image.asset(
                "assets/images/logo.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            if (isWide) ...[
              const SizedBox(width: 8),
              Text("Tamil Social Club", style: AppTextStyles.display(size: 15, weight: FontWeight.w600)),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.goNamed("tamilTwin"),
          child: Text("Tamil Twin", style: AppTextStyles.body(size: 14, weight: FontWeight.w600)),
        ),
        TextButton(
          onPressed: () => context.goNamed("chapter0"),
          child: Text("Chapter 0", style: AppTextStyles.body(size: 14, weight: FontWeight.w600)),
        ),
        if (isWide)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: FilledButton(
              style: FilledButton.styleFrom(backgroundColor: AppColors.teal900, shape: const StadiumBorder()),
              onPressed: () {
                AnalyticsService.track("whatsapp_clicked", {"from": "nav"});
                ShareService.openUrl(AppLinks.whatsapp);
              },
              child: Text("Join the club", style: AppTextStyles.button(color: AppColors.cream).copyWith(fontSize: 13)),
            ),
          ),
      ],
    );
  }
}
