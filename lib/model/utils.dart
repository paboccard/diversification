enum FeedbackForFood { SAD, FRAWN, SMILE, LAUGH, HEART }

extension FeedbackForFoodExtension on FeedbackForFood {
  double get sliderValue {
    switch (this) {
      case FeedbackForFood.SAD:
        return 0.0;
        break;
      case FeedbackForFood.FRAWN:
        return 4.0;
        break;
      case FeedbackForFood.SMILE:
        return 6.0;
        break;
      case FeedbackForFood.LAUGH:
        return 8.0;
        break;
      case FeedbackForFood.HEART:
        return 10.0;
        break;
      default:
        return 6.0;
    }
  }

  String get sliderName {
    switch (this) {
      case FeedbackForFood.SAD:
        return "Déteste";
        break;
      case FeedbackForFood.FRAWN:
        return "Moyen";
        break;
      case FeedbackForFood.SMILE:
        return "Aime bien";
        break;
      case FeedbackForFood.LAUGH:
        return "Adore";
        break;
      case FeedbackForFood.HEART:
        return "Coup de coeur";
        break;
      default:
        return "Aime bien";
    }
  }
}
