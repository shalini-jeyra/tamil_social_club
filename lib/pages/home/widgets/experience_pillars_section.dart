import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";

/// PRD §9 — "PICK YOUR KIND OF WEEKEND" — 6 experience pillars.
/// Inactive ones are marked COMING SOON.
class ExperiencePillarsSection extends StatelessWidget {
  const ExperiencePillarsSection({super.key});

  // Funnier, less formal copy for the community vibe.
  static const _pillars = [
    _Pillar("🎲", "Play", "Board games, Mafia betrayals, and shouting in Tamil over Uno.", true),
    _Pillar("🎥", "Cinema", "FDFS energy, overanalyzing Kollywood, and peak pop culture.", true),
    _Pillar("🍜", "Food", "Filter kaapi, proper biryani, and finding the best spots.", false),
    _Pillar("🎤", "Music", "Belting out SPB hits, kuthu beats, and acoustic jamming.", false),
    _Pillar("🪩", "Social", "House parties, mixers, and yapping in Tanglish till 3 AM.", false),
    _Pillar("🏕️", "Escape", "Touching grass. Weekend trips and escaping Silk Board traffic.", false),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: AppColors.creamSoft,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 64 : 96,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("WHAT WE DO", style: AppTextStyles.eyebrow()),
              const SizedBox(height: 12),
              Text(
                "Pick your kind of weekend.",
                style: AppTextStyles.display(size: isMobile ? 28 : 42),
              ),
              const SizedBox(height: 48),
              isMobile ? _mobileGrid() : _desktopGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _desktopGrid() {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _PillarCard(pillar: _pillars[0])),
              const SizedBox(width: 20),
              Expanded(child: _PillarCard(pillar: _pillars[1])),
              const SizedBox(width: 20),
              Expanded(child: _PillarCard(pillar: _pillars[2])),
            ],
          ),
        ),
        const SizedBox(height: 20),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _PillarCard(pillar: _pillars[3])),
              const SizedBox(width: 20),
              Expanded(child: _PillarCard(pillar: _pillars[4])),
              const SizedBox(width: 20),
              Expanded(child: _PillarCard(pillar: _pillars[5])),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mobileGrid() {
    return Column(
      children: [
        for (int i = 0; i < _pillars.length; i += 2)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: _PillarCard(pillar: _pillars[i])),
                  const SizedBox(width: 16),
                  Expanded(
                    child: i + 1 < _pillars.length
                        ? _PillarCard(pillar: _pillars[i + 1])
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _Pillar {
  final String emoji;
  final String name;
  final String description;
  final bool active;
  const _Pillar(this.emoji, this.name, this.description, this.active);
}

class _PillarCard extends StatefulWidget {
  final _Pillar pillar;
  const _PillarCard({super.key, required this.pillar});

  @override
  State<_PillarCard> createState() => _PillarCardState();
}

class _PillarCardState extends State<_PillarCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final pillar = widget.pillar;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: pillar.active ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: pillar.active
              ? (_isHovered ? AppColors.offWhite : AppColors.cream)
              : AppColors.creamSoft,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: pillar.active
                ? (_isHovered ? AppColors.gold.withOpacity(0.5) : AppColors.teal900.withOpacity(0.12))
                : AppColors.charcoal.withOpacity(0.06),
          ),
          boxShadow: _isHovered && pillar.active
              ? [
                  BoxShadow(
                    color: AppColors.charcoal.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  )
                ]
              : [],
        ),
        transform: Matrix4.translationValues(0, _isHovered && pillar.active ? -4 : 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(pillar.emoji, style: const TextStyle(fontSize: 28)),
                const Spacer(),
                if (!pillar.active)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.charcoal.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "COMING SOON",
                      style: AppTextStyles.eyebrow(color: AppColors.charcoal.withOpacity(0.4)),
                    ),
                  ),
              ],
            ),
            const Spacer(),
            const SizedBox(height: 14),
            Text(
              pillar.name,
              style: AppTextStyles.display(
                size: 17,
                color: pillar.active ? AppColors.charcoal : AppColors.charcoal.withOpacity(0.4),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              pillar.description,
              style: AppTextStyles.body(
                size: 14,
                color: pillar.active
                    ? AppColors.charcoal.withOpacity(0.65)
                    : AppColors.charcoal.withOpacity(0.35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
