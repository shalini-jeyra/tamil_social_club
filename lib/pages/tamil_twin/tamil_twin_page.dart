import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../../core/theme/app_colors.dart";
import "../../data/questions.dart";
import "../../data/results.dart";
import "../../services/analytics_service.dart";
import "widgets/calculating_view.dart";
import "widgets/landing_view.dart";
import "widgets/quiz_view.dart";
import "widgets/result_view.dart";

enum _Stage { landing, quiz, calculating, result }

/// Route: "/tamil-twin" — the full immersive game flow.
/// Landing -> 8 questions -> calculating -> result -> share -> Chapter 0.
class TamilTwinPage extends StatefulWidget {
  const TamilTwinPage({super.key});

  @override
  State<TamilTwinPage> createState() => _TamilTwinPageState();
}

class _TamilTwinPageState extends State<TamilTwinPage> {
  _Stage _stage = _Stage.landing;
  int _qIndex = 0;
  final Map<String, int> _scores = {};
  String? _resultKey;

  void _start() {
    AnalyticsService.track("twin_game_started");
    setState(() {
      _qIndex = 0;
      _scores.clear();
      _stage = _Stage.quiz;
    });
  }

  void _restart() {
    setState(() {
      _qIndex = 0;
      _scores.clear();
      _resultKey = null;
      _stage = _Stage.landing;
    });
  }

  void _answer(String archetypeKey) {
    _scores[archetypeKey] = (_scores[archetypeKey] ?? 0) + 1;
    AnalyticsService.track("question_answered", {"index": _qIndex, "key": archetypeKey});

    if (_qIndex < tamilTwinQuestions.length - 1) {
      setState(() => _qIndex += 1);
      return;
    }

    setState(() => _stage = _Stage.calculating);
    Future.delayed(const Duration(milliseconds: 1300), () {
      if (!mounted) return;
      final winner = _scores.entries.reduce((a, b) => a.value >= b.value ? a : b).key;
      setState(() {
        _resultKey = winner;
        _stage = _Stage.result;
      });
      AnalyticsService.track("twin_game_completed", {"result": winner});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppHeader(),
      drawer: const AppDrawer(),
      backgroundColor: AppColors.teal900,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildStage(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStage() {
    switch (_stage) {
      case _Stage.landing:
        return LandingView(onStart: _start);
      case _Stage.quiz:
        return QuizView(
          index: _qIndex,
          total: tamilTwinQuestions.length,
          question: tamilTwinQuestions[_qIndex],
          onAnswer: _answer,
        );
      case _Stage.calculating:
        return const CalculatingView();
      case _Stage.result:
        final result = tamilTwinResults[_resultKey]!;
        return ResultView(
          result: result,
          onRetake: _restart,
          onMeetPeople: () {
            AnalyticsService.track("chapter_0_viewed", {"from": "result_page"});
            context.goNamed("chapter0");
          },
        );
    }
  }
}
