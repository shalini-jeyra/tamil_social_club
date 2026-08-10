# Tamil Social Club — V1 Website (Flutter Web)

Flutter Web implementation of the Tamil Social Club PRD: homepage, the
"Tamil Twin" quiz game, and the Chapter 0 event page.

## Run it

```bash
flutter pub get
flutter run -d chrome
```

## Build for Firebase Hosting

```bash
flutter build web --release
firebase deploy --only hosting
```

## Before you launch

Open `lib/core/constants/links.dart` and replace the placeholder URLs with
your real WhatsApp invite link, Instagram handle, and Luma event link.

## Structure

```
lib/
├── main.dart
├── core/            theme, routing (go_router), constants/links
├── models/          QuizQuestion, TwinResult, ClubEvent
├── data/            the 8 quiz questions, 6 archetypes, Chapter 0 event
├── pages/
│   ├── home/        hero, Tamil Twin teaser, Chapter 0 teaser,
│   │                community, about, Instagram sections
│   ├── tamil_twin/  landing → 8 questions → calculating → result → share
│   └── chapter_0/   event details + Luma hand-off
├── widgets/         buttons, cards, section wrapper, header/footer
└── services/        share_service (WhatsApp/copy link), analytics_service (stub)
```

## Notes

- No backend in V1 — matches the PRD. Registration happens on Luma.
- `AnalyticsService.track(...)` is a stub; swap its body for Firebase
  Analytics later without touching call sites (already placed at every
  event listed in PRD section 24).
- Colors, type and the Tamil Twin quiz scoring live in
  `lib/core/theme/` and `lib/data/` — tweak content there first.
