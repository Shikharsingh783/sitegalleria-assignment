import 'package:flutter/material.dart';
import 'package:sitegalleria/models/type.dart';

class Data extends ChangeNotifier {
  final List<ServiceType> _service = [
    // Marriage
    ServiceType(
      price: 999,
      rating: 4.95,
      title: 'Marriage Timing Prediction',
      description:
          '''Discover the perfect timing for your marriage through the guidance of Vedic Astrology and an advanced AI-ML model.''',
      type: Category.marriage,
    ),
    ServiceType(
      price: 1199,
      rating: 4.85,
      title: 'Marriage Compatibility Analysis',
      description:
          '''Analyze compatibility between partners using astrology to understand relationship dynamics better.''',
      type: Category.marriage,
    ),
    ServiceType(
      price: 899,
      rating: 4.7,
      title: 'Marriage Counselling',
      description:
          '''Get expert counseling for a happy, successful marriage life through astrological insights.''',
      type: Category.marriage,
    ),
    ServiceType(
      price: 1299,
      rating: 4.9,
      title: 'Ideal Partner Search',
      description:
          '''Find your ideal partner based on astrological compatibility and personalized advice.''',
      type: Category.marriage,
    ),

    // Career
    ServiceType(
      price: 1499,
      rating: 4.9,
      title: 'Career Growth Prediction',
      description:
          '''Predict your career growth and success through astrological methods and AI-powered predictions.''',
      type: Category.career,
    ),
    ServiceType(
      price: 999,
      rating: 4.75,
      title: 'Job Change Advice',
      description:
          '''Get personalized advice on when to switch jobs for optimal growth and success in your career.''',
      type: Category.career,
    ),
    ServiceType(
      price: 899,
      rating: 4.65,
      title: 'Promotion Timing Prediction',
      description:
          '''Find the best times for promotion opportunities in your job using Vedic Astrology insights.''',
      type: Category.career,
    ),
    ServiceType(
      price: 1099,
      rating: 4.8,
      title: 'Business Growth Forecast',
      description:
          '''Receive a forecast of your business's growth potential based on astrology and personalized advice.''',
      type: Category.career,
    ),

    // Family
    ServiceType(
      price: 799,
      rating: 4.5,
      title: 'Family Relationship Analysis',
      description:
          '''Understand and improve your relationships with family members through astrological insights.''',
      type: Category.family,
    ),
    ServiceType(
      price: 1099,
      rating: 4.7,
      title: 'Child’s Future Prediction',
      description:
          '''Predict your child’s future career and life path through astrological guidance.''',
      type: Category.family,
    ),
    ServiceType(
      price: 999,
      rating: 4.65,
      title: 'Family Harmony Solutions',
      description:
          '''Learn how to create and maintain harmony in your family using astrological methods.''',
      type: Category.family,
    ),
    ServiceType(
      price: 1299,
      rating: 4.85,
      title: 'Ancestral Healing',
      description:
          '''Heal your ancestral lineage and resolve family issues through spiritual and astrological techniques.''',
      type: Category.family,
    ),

    // Health
    ServiceType(
      price: 1399,
      rating: 4.9,
      title: 'Health Problem Solutions',
      description:
          '''Get personalized solutions to your health problems based on astrological readings and analysis.''',
      type: Category.health,
    ),
    ServiceType(
      price: 1199,
      rating: 4.8,
      title: 'Mental Wellness Guidance',
      description:
          '''Improve your mental well-being with personalized astrology-based guidance and advice.''',
      type: Category.health,
    ),
    ServiceType(
      price: 999,
      rating: 4.7,
      title: 'Longevity Prediction',
      description:
          '''Discover how astrology can provide insights into your health and longevity.''',
      type: Category.health,
    ),
    ServiceType(
      price: 899,
      rating: 4.6,
      title: 'Astrological Health Remedies',
      description:
          '''Receive remedies and solutions to improve your overall health using ancient astrological methods.''',
      type: Category.health,
    ),
  ];

  // Getter
  List<ServiceType> get service => _service;
}
