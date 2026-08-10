import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../core/constants/links.dart";
import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";
import "../../services/analytics_service.dart";
import "../../services/share_service.dart";

/// Mobile navigation drawer per PRD §20.
/// Items: Home, Experiences, Tamil Twin, Join Community
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.creamSoft,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 36,
                      width: 36,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Tamil Social Club",
                    style: AppTextStyles.display(size: 14, weight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const Divider(),
            _DrawerItem("Home", Icons.home_outlined, () {
              Navigator.pop(context);
              context.goNamed("home");
            }),
            _DrawerItem("Experiences", Icons.event_outlined, () {
              Navigator.pop(context);
              context.goNamed("experiences");
            }),
            _DrawerItem("Tamil Twin", Icons.quiz_outlined, () {
              Navigator.pop(context);
              context.goNamed("tamilTwin");
            }),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.teal900,
                  shape: const StadiumBorder(),
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  AnalyticsService.track("whatsapp_clicked", {"from": "drawer"});
                  ShareService.openUrl(AppLinks.whatsapp);
                },
                child: Text(
                  "Join the Community",
                  style: AppTextStyles.button(color: AppColors.cream),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const _DrawerItem(this.label, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.charcoal.withOpacity(0.6)),
      title: Text(label, style: AppTextStyles.body(size: 16, weight: FontWeight.w500)),
      onTap: onTap,
    );
  }
}
