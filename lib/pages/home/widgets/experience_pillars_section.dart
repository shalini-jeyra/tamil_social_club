import "package:flutter/material.dart";
import "package:lucide_icons/lucide_icons.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";

class ExperiencePillarsSection extends StatelessWidget {
  const ExperiencePillarsSection({super.key});

  static const _pillars = [
    _Pillar(LucideIcons.dices, "PLAY", "Games, Mafia, board games and chaos."),
    _Pillar(LucideIcons.mic, "MUSIC", "Karaoke, jamming and open mic nights."),
    _Pillar(LucideIcons.clapperboard, "CINEMA", "Tamil movies, screenings and pop-culture."),
    _Pillar(LucideIcons.sandwich, "FOOD", "Food crawls, dinners and café plans."),
    _Pillar(LucideIcons.partyPopper, "SOCIAL", "Mixers, house parties and late nights."),
    _Pillar(LucideIcons.mountain, "ESCAPE", "Trips, hikes and weekend getaways."),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    
    return Container(
      width: double.infinity,
      color: AppColors.offWhite,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 64 : 96,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile ? _mobileLayout() : _desktopLayout(),
        ),
      ),
    );
  }

  Widget _desktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Text Block
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(right: 48, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What's your kind of weekend?",
                  style: AppTextStyles.handwriting(color: AppColors.gold, size: 24),
                ),
                const SizedBox(height: 12),
                Text(
                  "WE GET UP TO\nA LOT OF THINGS.",
                  style: AppTextStyles.display(size: 42).copyWith(letterSpacing: -0.5, height: 1.05),
                ),
                const SizedBox(height: 24),
                Text(
                  "Pick your vibe. We've got people for that.",
                  style: AppTextStyles.body(color: AppColors.charcoal.withOpacity(0.7), size: 18),
                ),
              ],
            ),
          ),
        ),
        // Right Scrolling Grid
        Expanded(
          flex: 8,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _pillars.map((p) => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: _PillarCard(pillar: p),
              )).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _mobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What's your kind of weekend?",
          style: AppTextStyles.handwriting(color: AppColors.gold, size: 24),
        ),
        const SizedBox(height: 12),
        Text(
          "WE GET UP TO\nA LOT OF THINGS.",
          style: AppTextStyles.display(size: 36).copyWith(letterSpacing: -0.5, height: 1.05),
        ),
        const SizedBox(height: 20),
        Text(
          "Pick your vibe. We've got people for that.",
          style: AppTextStyles.body(color: AppColors.charcoal.withOpacity(0.7), size: 16),
        ),
        const SizedBox(height: 40),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: _pillars.map((p) => Padding(
              padding: const EdgeInsets.only(right: 16),
              child: _PillarCard(pillar: p),
            )).toList(),
          ),
        ),
      ],
    );
  }
}

class _Pillar {
  final IconData icon;
  final String title;
  final String description;
  const _Pillar(this.icon, this.title, this.description);
}

class _PillarCard extends StatefulWidget {
  final _Pillar pillar;
  const _PillarCard({required this.pillar});

  @override
  State<_PillarCard> createState() => _PillarCardState();
}

class _PillarCardState extends State<_PillarCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 180,
        height: 240,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? AppColors.gold.withOpacity(0.5) : AppColors.charcoal.withOpacity(0.1),
            width: 1,
          ),
          boxShadow: _isHovered ? [
            BoxShadow(
              color: AppColors.charcoal.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ] : [],
        ),
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(widget.pillar.icon, size: 36, color: _isHovered ? AppColors.gold : AppColors.teal900),
            const SizedBox(height: 24),
            Text(
              widget.pillar.title,
              style: AppTextStyles.button(color: AppColors.charcoal).copyWith(letterSpacing: 1),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              widget.pillar.description,
              style: AppTextStyles.body(size: 13, color: AppColors.charcoal.withOpacity(0.7)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
