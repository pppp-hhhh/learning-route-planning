import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:ai_learning_route_planner/core/database/app_database.dart';
import 'package:ai_learning_route_planner/features/roadmap/presentation/providers/providers.dart';
import 'package:ai_learning_route_planner/l10n/app_localizations.dart';
import 'package:ai_learning_route_planner/services/ai/sm2_algorithm.dart';

class FlashcardReviewScreen extends ConsumerStatefulWidget {
  final String roadmapId;

  const FlashcardReviewScreen({super.key, required this.roadmapId});

  @override
  ConsumerState<FlashcardReviewScreen> createState() =>
      _FlashcardReviewScreenState();
}

class _FlashcardReviewScreenState extends ConsumerState<FlashcardReviewScreen> {
  final PageController _pageController = PageController();
  List<Flashcard> _cards = [];
  int _currentIndex = 0;
  bool _isFlipped = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    final db = ref.read(databaseProvider);
    final cards = await db.getFlashcardsByRoadmapId(widget.roadmapId);
    if (mounted) {
      setState(() {
        _cards = cards;
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _flipCard() {
    setState(() => _isFlipped = !_isFlipped);
  }

  void _nextCard() {
    if (_currentIndex < _cards.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentIndex++;
        _isFlipped = false;
      });
    }
  }

  void _previousCard() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentIndex--;
        _isFlipped = false;
      });
    }
  }

  Future<void> _rateCard(int quality) async {
    if (_cards.isEmpty) return;
    final card = _cards[_currentIndex];
    final db = ref.read(databaseProvider);
    final uuid = const Uuid();

    // SM-2 calculation
    final result = SM2Algorithm.calculate(
      quality: quality,
      repetitions: card.repetitions,
      easeFactor: card.easeFactor,
      interval: card.interval,
    );

    // Update flashcard with new SM-2 values
    await db.updateFlashcard(FlashcardsCompanion(
      id: Value(card.id),
      repetitions: Value(result.repetitions),
      easeFactor: Value(result.easeFactor),
      interval: Value(result.interval),
      nextReview: Value(result.nextReview.millisecondsSinceEpoch),
    ));

    // Save review record
    await db.insertReview(ReviewsCompanion(
      id: Value(uuid.v4()),
      flashcardId: Value(card.id),
      quality: Value(quality),
      reviewedAt: Value(DateTime.now().millisecondsSinceEpoch),
    ));

    if (!mounted) return;

    // Move to next card or finish
    if (_currentIndex < _cards.length - 1) {
      _nextCard();
    } else {
      setState(() => _isFlipped = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.reviewComplete)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.reviewFlashcards)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_cards.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.reviewFlashcards)),
        body: Center(child: Text(l10n.noResults)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${l10n.reviewFlashcards} (${_currentIndex + 1}/${_cards.length})'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.end),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress bar
          LinearProgressIndicator(
            value: (_currentIndex + 1) / _cards.length,
          ),

          // Flashcard
          Expanded(
            child: GestureDetector(
              onTap: _flipCard,
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _cards.length,
                itemBuilder: (context, index) {
                  final c = _cards[index];
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _isFlipped
                        ? _Flashcard(
                            key: ValueKey('answer-${c.id}'),
                            content: c.answer,
                            label: l10n.answer,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                        : _Flashcard(
                            key: ValueKey('question-${c.id}'),
                            content: c.question,
                            label: l10n.question,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                  );
                },
              ),
            ),
          ),

          // Instructions
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              _isFlipped
                  ? 'How well did you know this?'
                  : 'Tap to reveal answer',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ),

          // Rating buttons (only show when flipped)
          if (_isFlipped)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: Row(
                children: [
                  Expanded(
                    child: _RatingButton(
                      label: l10n.again,
                      color: Colors.red,
                      onTap: () => _rateCard(SM2Algorithm.mapRatingToQuality(1)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _RatingButton(
                      label: l10n.hard,
                      color: Colors.orange,
                      onTap: () => _rateCard(SM2Algorithm.mapRatingToQuality(2)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _RatingButton(
                      label: l10n.good,
                      color: Colors.green,
                      onTap: () => _rateCard(SM2Algorithm.mapRatingToQuality(3)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _RatingButton(
                      label: l10n.easy,
                      color: Colors.teal,
                      onTap: () => _rateCard(SM2Algorithm.mapRatingToQuality(4)),
                    ),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed:
                        _currentIndex > 0 ? _previousCard : null,
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 32,
                  ),
                  const SizedBox(width: 48),
                  IconButton(
                    onPressed:
                        _currentIndex < _cards.length - 1 ? _nextCard : null,
                    icon: const Icon(Icons.arrow_forward),
                    iconSize: 32,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Flashcard extends StatelessWidget {
  final String content;
  final String label;
  final Color color;

  const _Flashcard({
    super.key,
    required this.content,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              content,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _RatingButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _RatingButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withValues(alpha: 0.1),
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: color.withValues(alpha: 0.3)),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
