class ClubEvent {
  final String title;
  final String dateLabel;
  final String timeLabel;
  final String location;
  final List<String> activities;
  final String price;
  final String capacityLabel;
  final String lumaUrl;

  const ClubEvent({
    required this.title,
    required this.dateLabel,
    required this.timeLabel,
    required this.location,
    required this.activities,
    required this.price,
    required this.capacityLabel,
    required this.lumaUrl,
  });
}
