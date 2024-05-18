import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

class SVGColorChanger implements ColorMapper {
  final Color oldColor;
  final Color newColor;

  SVGColorChanger({required this.oldColor, required this.newColor});

  @override
  Color substitute(
    String? id,
    String elementName,
    String attributeName,
    Color color,
  ) {
    if (color == oldColor) return newColor;
    return color;
  }
}
