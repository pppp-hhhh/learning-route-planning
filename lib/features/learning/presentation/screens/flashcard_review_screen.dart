import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlashcardReviewScreen extends ConsumerStatefulWidget {
  final String roadmapId;

  const FlashcardReviewScreen({super.key, required this.roadmapId});

  @override
  ConsumerState<FlashcardReviewScreen> createState() =>
      _FlashcardReviewScreenState();
}

class _FlashcardReviewScreenState extends ConsumerState<FlashcardReviewScreen> {
  int _currentIndex = 0;
  bool _isFlipped = false;
  final PageController _pageController = PageController();

  // Mock flashcards for demonstration
  final List<Map<String, String>> _mockCards = [
    {
      'question': 'What is Machine Learning?',
      'answer':
          'A subset of AI that enables systems to learn and improve from experience without being explicitly programmed.',
    },
    {
      'question': 'What is a Neural Network?',
      'answer':
          'A computing system inspired by biological neural networks, consisting of interconnected nodes (neurons) that process information.',
    },
    {
      'question': 'What is Supervised Learning?',
      'answer':
          'A type of machine learning where the algorithm learns from labeled training data to make predictions.',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _flipCard() {
    setState(() => _isFlipped = !_isFlipped);
  }

  void _nextCard() {
    if (_currentIndex < _mockCards.length - 1) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('End'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress indicator
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  '${_currentIndex + 1} / ${_mockCards.length}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: LinearProgressIndicator(
                    value: (_currentIndex + 1) / _mockCards.length,
                    backgroundColor: Colors.grey[200],
                  ),
                ),
              ],
            ),
          ),

          // Flashcard
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                  _isFlipped = false;
                });
              },
              itemCount: _mockCards.length,
              itemBuilder: (context, index) {
                final card = _mockCards[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: GestureDetector(
                    onTap: _flipCard,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _isFlipped
                          ? _Flashcard(
                              key: const ValueKey('answer'),
                              content: card['answer']!,
                              label: 'Answer',
                              color: Theme.of(context).colorScheme.secondary,
                            )
                          : _Flashcard(
                              key: const ValueKey('question'),
                              content: card['question']!,
                              label: 'Question',
                              color: Theme.of(context).colorScheme.primary,
                            ),
                    ),
                  ),
                );
              },
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
                      label: 'Again',
                      color: Colors.red,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _RatingButton(
                      label: 'Hard',
                      color: Colors.orange,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _RatingButton(
                      label: 'Good',
                      color: Colors.green,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _RatingButton(
                      label: 'Easy',
                      color: Colors.blue,
                      onTap: () {},
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
                        _currentIndex < _mockCards.length - 1 ? _nextCard : null,
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
            const SizedBox(height: 32),
            Text(
              content,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
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
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Text(label),
    );
  }
}
