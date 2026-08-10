import "package:flutter/material.dart";
import "../../../core/theme/app_colors.dart";
import "../../../core/theme/app_text_styles.dart";

/// PRD §9 — "PICK YOUR KIND OF WEEKEND" — 6 experience pillars.
/// Inactive ones are marked COMING SOON.
class ExperiencePillarsSection extends StatelessWidget {
  const ExperiencePillarsSection({super.key});

  static const _pillars = [
    _Pillar("🎲", "Play", "Games, Mafia, trivia and challenges.", true),
    _Pillar("🎥", "Cinema", "Tamil movies, discussions and pop culture.", true),
    _Pillar("🍜", "Food", "Food crawls, dinners and café plans.", false),
    _Pillar("🎤", "Music", "Karaoke, jamming and open mic.", false),
    _Pillar("🩩", "Social", "Mixers, house parties and late-night hangs.", false),
    _Pillar("🌄", "Escape", "Trips, hikes and weekend adventures.", false),
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
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: _pillars
          .map((p) => SizedBox(
                width: (980 - 40) / 3,
                child: _PillarCard(pillar: p),
              ))
          .toList(),
    );
  }

  Widget _mobileGrid() {
    return Column(
      children: [
        for (int i = 0; i < _pillars.length; i += 2)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
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

class _PillarCard extends StatelessWidget {
  final _Pillar pillar;
  const _PillarCard({super.key, required this.pillar});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: pillar.active ? AppColors.cream : AppColors.creamSoft,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: pillar.active ? AppColors.teal900.withOpacity(0.12) : AppColors.charcoal.withOpacity(0.06),
        ),
      ),
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
    );
  }
}
