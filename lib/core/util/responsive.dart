import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;

  Responsive({required this.context});

  double screenWidth() => MediaQuery.of(context).size.width;
  double screenHeight() => MediaQuery.of(context).size.height;

  // Common padding values
  double smallPadding() => screenWidth() * 0.02; // 2% of screen width
  double mediumPadding() => screenWidth() * 0.04; // 4% of screen width
  double largePadding() => screenWidth() * 0.06; // 6% of screen width

  // Common margin values
  double smallMargin() => screenWidth() * 0.02; // 2% of screen width
  double mediumMargin() => screenWidth() * 0.04; // 4% of screen width
  double largeMargin() => screenWidth() * 0.06; // 6% of screen width

  // Common text sizes
  double ultraSmallText() => screenWidth() * 0.03; // 3% of screen width
  double smallText() => screenWidth() * 0.04; // 4% of screen width
  double mediumText() => screenWidth() * 0.05; // 5% of screen width
  double largeText() => screenWidth() * 0.06; // 6% of screen width

  // Common widget sizes
  double smallWidget() => screenWidth() * 0.3; // 30% of screen width
  double mediumWidget() => screenWidth() * 0.5; // 50% of screen width
  double largeWidget() => screenWidth() * 0.7; // 70% of screen width

  bool isMobile() => screenWidth() < 600;
  bool isTablet() => screenWidth() >= 600 && screenWidth() < 1200;
  bool isDesktop() => screenWidth() >= 1200;
}
