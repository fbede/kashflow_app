import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';

extension AppTextTheme on TextTheme {
  TextStyle get bodyNormal => _bodyStyle;
  TextStyle get labelNormal => _labelStyle;
  TextStyle get titleNormal => _titleStyle;
  TextStyle get headlineNormal => _headlineStyle;
  TextStyle get displayNormal => _displayStyle;

  TextStyle get bodyBold => _bodyStyle.copyWith(fontWeight: FontWeight.bold);
  TextStyle get labelBold => _labelStyle.copyWith(fontWeight: FontWeight.bold);
  TextStyle get titleBold => _titleStyle.copyWith(fontWeight: FontWeight.bold);
  TextStyle get headlineBold =>
      _headlineStyle.copyWith(fontWeight: FontWeight.bold);
  TextStyle get displayBold =>
      _displayStyle.copyWith(fontWeight: FontWeight.bold);

  static TextTheme get theme => TextTheme(
        displayLarge: _displayStyle,
        displayMedium: _displayStyle,
        displaySmall: _displayStyle,
        headlineLarge: _headlineStyle,
        headlineMedium: _headlineStyle,
        headlineSmall: _headlineStyle,
        titleLarge: _titleStyle,
        titleMedium: _titleStyle,
        titleSmall: _titleStyle,
        bodyLarge: _bodyStyle,
        bodyMedium: _bodyStyle,
        bodySmall: _bodyStyle,
        labelLarge: _labelStyle,
        labelMedium: _labelStyle,
        labelSmall: _labelStyle,
      );
}

final _displayStyle = _baseTextStyle.copyWith(
  fontSize: 31,
  height: 1.2,
);
final _headlineStyle = _baseTextStyle.copyWith(
  fontSize: 25,
  height: 1.2,
);
final _titleStyle = _baseTextStyle.copyWith(
  fontSize: 20,
  height: 1.2,
);
final _bodyStyle = _baseTextStyle.copyWith(fontSize: 16, height: 1.5);
final _labelStyle = _baseTextStyle.copyWith(
  fontSize: 13,
  height: 1.5,
  fontWeight: FontWeight.w500,
);

const _baseTextStyle = TextStyle(
  fontFamily: FontFamily.poppins,
  fontFamilyFallback: [FontFamily.notoSans],
  fontWeight: FontWeight.w400,
);
