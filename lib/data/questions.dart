import "../models/quiz_question.dart";

/// 8 questions, 4 answers each, mapped to one of the 6 Tamil Twin archetypes.
final List<QuizQuestion> tamilTwinQuestions = [
  const QuizQuestion(
    text: "It's Friday, 8 PM. What's the plan?",
    options: [
      QuizOption(label: "🍻 Somewhere loud", archetypeKey: "mass"),
      QuizOption(label: "🍿 Movie + food", archetypeKey: "cinema"),
      QuizOption(label: "🎲 Games with people", archetypeKey: "chaos"),
      QuizOption(label: "🛋️ Home. I'm tired.", archetypeKey: "connector"),
    ],
  ),
  const QuizQuestion(
    text: "Your weekend pitch to friends sounds like...",
    options: [
      QuizOption(label: 'This\'ll be so much fun, trust me', archetypeKey: "chaos"),
      QuizOption(label: 'There\'s a new place, we HAVE to try it', archetypeKey: "foodie"),
      QuizOption(label: 'Let\'s just watch something and talk', archetypeKey: "cinema"),
      QuizOption(label: 'Let\'s go somewhere far for once', archetypeKey: "explorer"),
    ],
  ),
  const QuizQuestion(
    text: "In a group, you're usually the one who...",
    options: [
      QuizOption(label: "Starts the plan", archetypeKey: "mass"),
      QuizOption(label: "Finds the food spot", archetypeKey: "foodie"),
      QuizOption(label: "Makes sure the quiet one is talking too", archetypeKey: "connector"),
      QuizOption(label: "Convinces everyone to do the risky thing", archetypeKey: "chaos"),
    ],
  ),
  const QuizQuestion(
    text: "Your Tamil cinema opinion is...",
    options: [
      QuizOption(label: "Vijay vs Ajith, no in-between", archetypeKey: "mass"),
      QuizOption(label: "I have a ranked list of every Rajini movie", archetypeKey: "cinema"),
      QuizOption(label: "Honestly, I watch it for the food scenes", archetypeKey: "foodie"),
      QuizOption(label: "Wait, is there a new one out? Send link", archetypeKey: "explorer"),
    ],
  ),
  const QuizQuestion(
    text: "Someone suggests a random weekend trip. You say:",
    options: [
      QuizOption(label: "When are we leaving", archetypeKey: "explorer"),
      QuizOption(label: "Where are we eating on the way", archetypeKey: "foodie"),
      QuizOption(label: "Only if it's chill, no big plans", archetypeKey: "connector"),
      QuizOption(label: "Can we make it a full production", archetypeKey: "chaos"),
    ],
  ),
  const QuizQuestion(
    text: "At a party full of strangers, you:",
    options: [
      QuizOption(label: "Own the room within 10 minutes", archetypeKey: "mass"),
      QuizOption(label: "Find two interesting people and talk all night", archetypeKey: "connector"),
      QuizOption(label: "End up leading an impromptu game", archetypeKey: "chaos"),
      QuizOption(label: "Find the snack table and don't leave", archetypeKey: "foodie"),
    ],
  ),
  const QuizQuestion(
    text: "Your ideal Bengaluru evening is...",
    options: [
      QuizOption(label: "Rooftop, loud music, big group", archetypeKey: "mass"),
      QuizOption(label: "Filter coffee, hole-in-the-wall, deep conversation", archetypeKey: "connector"),
      QuizOption(label: "An offbeat spot no one's heard of", archetypeKey: "explorer"),
      QuizOption(label: "A marathon of one movie franchise", archetypeKey: "cinema"),
    ],
  ),
  const QuizQuestion(
    text: "Pick a dare, Chaos-Agent-approved:",
    options: [
      QuizOption(label: "Talk to the loudest table in the room", archetypeKey: "mass"),
      QuizOption(label: "Order the weirdest thing on the menu", archetypeKey: "foodie"),
      QuizOption(label: "Start a mafia game with strangers", archetypeKey: "chaos"),
      QuizOption(label: "Book tickets to somewhere random, right now", archetypeKey: "explorer"),
    ],
  ),
];
