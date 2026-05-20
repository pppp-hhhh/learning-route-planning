import 'dart:math';
import 'package:ai_learning_route_planner/core/constants/app_constants.dart';

class SM2Algorithm {
  SM2Algorithm._();

  static const double minEaseFactor = AppConstants.minEaseFactor;
  static const double maxEaseFactor = AppConstants.maxEaseFactor;
  static const double defaultEaseFactor = AppConstants.defaultEaseFactor;
  static const int initialInterval = AppConstants.initialInterval;
  static const int secondInterval = AppConstants.secondInterval;

  static SM2Result calculate({
    required int quality,
    required int repetitions,
    required double easeFactor,
    required int interval,
  }) {
    int newRepetitions;
    int newInterval;
    double newEaseFactor;

    if (quality >= 3) {
      // Correct response
      if (repetitions == 0) {
        newInterval = initialInterval;
      } else if (repetitions == 1) {
        newInterval = secondInterval;
      } else {
        newInterval = (interval * easeFactor).round();
      }
      newRepetitions = repetitions + 1;
    } else {
      // Incorrect response - reset
      newRepetitions = 0;
      newInterval = initialInterval;
    }

    // Update ease factor using SM-2 formula
    newEaseFactor = easeFactor +
        (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02));

    // Clamp ease factor
    newEaseFactor = max(minEaseFactor, min(maxEaseFactor, newEaseFactor));

    // Calculate next review date
    final nextReview = DateTime.now().add(Duration(days: newInterval));

    return SM2Result(
      repetitions: newRepetitions,
      easeFactor: newEaseFactor,
      interval: newInterval,
      nextReview: nextReview,
      quality: quality,
    );
  }

  static String getQualityLabel(int quality) {
    switch (quality) {
      case 0:
        return 'Complete blackout';
      case 1:
        return 'Incorrect, but remembered upon seeing answer';
      case 2:
        return 'Incorrect, but answer seemed easy to recall';
      case 3:
        return 'Correct with serious difficulty';
      case 4:
        return 'Correct with some hesitation';
      case 5:
        return 'Perfect response';
      default:
        return 'Unknown';
    }
  }

  static List<int> getQualityOptions() => [0, 1, 2, 3, 4, 5];

  static int mapRatingToQuality(int rating) {
    // Maps 1-4 star rating to 0-5 quality scale
    switch (rating) {
      case 1:
        return 0;
      case 2:
        return 2;
      case 3:
        return 3;
      case 4:
        return 5;
      default:
        return 3;
    }
  }
}

class SM2Result {
  final int repetitions;
  final double easeFactor;
  final int interval;
  final DateTime nextReview;
  final int quality;

  const SM2Result({
    required this.repetitions,
    required this.easeFactor,
    required this.interval,
    required this.nextReview,
    required this.quality,
  });

  @override
  String toString() {
    return 'SM2Result(repetitions: $repetitions, easeFactor: ${easeFactor.toStringAsFixed(2)}, '
        'interval: $interval days, nextReview: $nextReview, quality: $quality)';
  }
}
