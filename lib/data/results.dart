import "../models/twin_result.dart";

/// The six Tamil Twin archetypes and their result-screen content.
final Map<String, TwinResult> tamilTwinResults = {
  "mass": const TwinResult(
    key: "mass",
    emoji: "🕶️",
    name: "The Mass",
    line: "Confident, outgoing, natural leader.",
    zinger: "Every group chat somehow becomes about you within a week.",
    tags: ["Confident", "Magnetic", "Loud (in a good way)"],
    mission: "Walk up to the person no one's talking to and own the conversation.",
  ),
  "chaos": const TwinResult(
    key: "chaos",
    emoji: "🎲",
    name: "The Chaos Agent",
    line: "Spontaneous, playful, slightly dangerous in group games.",
    zinger: "You said you'd stay for one game. We both know that's a lie.",
    tags: ["Spontaneous", "Playful", "Social"],
    mission: "Find 3 people you've never met and introduce yourself.",
  ),
  "cinema": const TwinResult(
    key: "cinema",
    emoji: "🎬",
    name: "The Cinema Buff",
    line: "Tamil cinema is not entertainment. It's a personality trait.",
    zinger: "You've quoted a movie dialogue in a normal conversation this week. Don't deny it.",
    tags: ["Opinionated", "Nostalgic", "Quotable"],
    mission: "Get someone to argue with you about the best Tamil movie villain.",
  ),
  "foodie": const TwinResult(
    key: "foodie",
    emoji: "🍜",
    name: "The Foodie",
    line: "Every plan eventually becomes a food plan.",
    zinger: "You've already decided where you're eating after this game ends.",
    tags: ["Curious", "Hungry", "Always right about food"],
    mission: "Find out everyone's favourite Bengaluru food spot before the night ends.",
  ),
  "explorer": const TwinResult(
    key: "explorer",
    emoji: "🧭",
    name: "The Explorer",
    line: "Always looking for the next place, trip or experience.",
    zinger: 'You\'ve googled "places near Bengaluru" more times than you\'ve actually gone.',
    tags: ["Restless", "Curious", "Always planning the next one"],
    mission: "Ask someone for the most random place they've been in Bengaluru — and actually go.",
  ),
  "connector": const TwinResult(
    key: "connector",
    emoji: "🫶",
    name: "The Connector",
    line: "You came looking for people, not just plans.",
    zinger: "You didn't come for the plan. You came for the people. Same thing, really.",
    tags: ["Warm", "Curious", "Genuinely interested"],
    mission: "Learn one real thing about three different people tonight.",
  ),
};
