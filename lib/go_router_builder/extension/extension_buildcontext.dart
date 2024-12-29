import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  static double threshold = 600;
  bool get isMobile => MediaQuery.of(this).size.width < threshold;
  bool get isDesktop => MediaQuery.of(this).size.width >= threshold;
}
