class QuizOption {
  final String label;
  final String archetypeKey;

  const QuizOption({required this.label, required this.archetypeKey});
}

class QuizQuestion {
  final String text;
  final List<QuizOption> options;

  const QuizQuestion({required this.text, required this.options});
}
