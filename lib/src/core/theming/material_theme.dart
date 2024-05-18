import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() => const MaterialScheme(
        brightness: Brightness.light,
        primary: Color(0xff006a6a),
        surfaceTint: Color(0xff006a6a),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xff9cf1f0),
        onPrimaryContainer: Color(0xff002020),
        secondary: Color(0xff3a693b),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffbbf0b6),
        onSecondaryContainer: Color(0xff002105),
        tertiary: Color(0xff4a662c),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffcceda5),
        onTertiaryContainer: Color(0xff0f2000),
        error: Color(0xff904b40),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdad4),
        onErrorContainer: Color(0xff3a0905),
        background: Color(0xfff4fbfa),
        onBackground: Color(0xff161d1d),
        surface: Color(0xfff4fbfa),
        onSurface: Color(0xff161d1d),
        surfaceVariant: Color(0xffdae5e4),
        onSurfaceVariant: Color(0xff3f4948),
        outline: Color(0xff6f7979),
        outlineVariant: Color(0xffbec9c8),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff2b3231),
        inverseOnSurface: Color(0xffecf2f1),
        inversePrimary: Color(0xff80d5d4),
        primaryFixed: Color(0xff9cf1f0),
        onPrimaryFixed: Color(0xff002020),
        primaryFixedDim: Color(0xff80d5d4),
        onPrimaryFixedVariant: Color(0xff004f50),
        secondaryFixed: Color(0xffbbf0b6),
        onSecondaryFixed: Color(0xff002105),
        secondaryFixedDim: Color(0xff9fd49b),
        onSecondaryFixedVariant: Color(0xff215025),
        tertiaryFixed: Color(0xffcceda5),
        onTertiaryFixed: Color(0xff0f2000),
        tertiaryFixedDim: Color(0xffb0d18b),
        onTertiaryFixedVariant: Color(0xff344e17),
        surfaceDim: Color(0xffd5dbda),
        surfaceBright: Color(0xfff4fbfa),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xffeff5f4),
        surfaceContainer: Color(0xffe9efee),
        surfaceContainerHigh: Color(0xffe3e9e9),
        surfaceContainerHighest: Color(0xffdde4e3),
      );

  ThemeData light() => theme(lightScheme().toColorScheme());

  static MaterialScheme lightMediumContrastScheme() => const MaterialScheme(
        brightness: Brightness.light,
        primary: Color(0xff004b4b),
        surfaceTint: Color(0xff006a6a),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xff238181),
        onPrimaryContainer: Color(0xffffffff),
        secondary: Color(0xff1d4c22),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xff4f804f),
        onSecondaryContainer: Color(0xffffffff),
        tertiary: Color(0xff304a13),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xff607d40),
        onTertiaryContainer: Color(0xffffffff),
        error: Color(0xff6e3027),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffaa6054),
        onErrorContainer: Color(0xffffffff),
        background: Color(0xfff4fbfa),
        onBackground: Color(0xff161d1d),
        surface: Color(0xfff4fbfa),
        onSurface: Color(0xff161d1d),
        surfaceVariant: Color(0xffdae5e4),
        onSurfaceVariant: Color(0xff3b4544),
        outline: Color(0xff576161),
        outlineVariant: Color(0xff737d7c),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff2b3231),
        inverseOnSurface: Color(0xffecf2f1),
        inversePrimary: Color(0xff80d5d4),
        primaryFixed: Color(0xff238181),
        onPrimaryFixed: Color(0xffffffff),
        primaryFixedDim: Color(0xff006767),
        onPrimaryFixedVariant: Color(0xffffffff),
        secondaryFixed: Color(0xff4f804f),
        onSecondaryFixed: Color(0xffffffff),
        secondaryFixedDim: Color(0xff376639),
        onSecondaryFixedVariant: Color(0xffffffff),
        tertiaryFixed: Color(0xff607d40),
        onTertiaryFixed: Color(0xffffffff),
        tertiaryFixedDim: Color(0xff48642a),
        onTertiaryFixedVariant: Color(0xffffffff),
        surfaceDim: Color(0xffd5dbda),
        surfaceBright: Color(0xfff4fbfa),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xffeff5f4),
        surfaceContainer: Color(0xffe9efee),
        surfaceContainerHigh: Color(0xffe3e9e9),
        surfaceContainerHighest: Color(0xffdde4e3),
      );

  ThemeData lightMediumContrast() =>
      theme(lightMediumContrastScheme().toColorScheme());

  static MaterialScheme lightHighContrastScheme() => const MaterialScheme(
        brightness: Brightness.light,
        primary: Color(0xff002727),
        surfaceTint: Color(0xff006a6a),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xff004b4b),
        onPrimaryContainer: Color(0xffffffff),
        secondary: Color(0xff002908),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xff1d4c22),
        onSecondaryContainer: Color(0xffffffff),
        tertiary: Color(0xff132700),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xff304a13),
        onTertiaryContainer: Color(0xffffffff),
        error: Color(0xff44100a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xff6e3027),
        onErrorContainer: Color(0xffffffff),
        background: Color(0xfff4fbfa),
        onBackground: Color(0xff161d1d),
        surface: Color(0xfff4fbfa),
        onSurface: Color(0xff000000),
        surfaceVariant: Color(0xffdae5e4),
        onSurfaceVariant: Color(0xff1c2625),
        outline: Color(0xff3b4544),
        outlineVariant: Color(0xff3b4544),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff2b3231),
        inverseOnSurface: Color(0xffffffff),
        inversePrimary: Color(0xffa6fbfa),
        primaryFixed: Color(0xff004b4b),
        onPrimaryFixed: Color(0xffffffff),
        primaryFixedDim: Color(0xff003333),
        onPrimaryFixedVariant: Color(0xffffffff),
        secondaryFixed: Color(0xff1d4c22),
        onSecondaryFixed: Color(0xffffffff),
        secondaryFixedDim: Color(0xff02350d),
        onSecondaryFixedVariant: Color(0xffffffff),
        tertiaryFixed: Color(0xff304a13),
        onTertiaryFixed: Color(0xffffffff),
        tertiaryFixedDim: Color(0xff1a3300),
        onTertiaryFixedVariant: Color(0xffffffff),
        surfaceDim: Color(0xffd5dbda),
        surfaceBright: Color(0xfff4fbfa),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xffeff5f4),
        surfaceContainer: Color(0xffe9efee),
        surfaceContainerHigh: Color(0xffe3e9e9),
        surfaceContainerHighest: Color(0xffdde4e3),
      );

  ThemeData lightHighContrast() =>
      theme(lightHighContrastScheme().toColorScheme());

  static MaterialScheme darkScheme() => const MaterialScheme(
        brightness: Brightness.dark,
        primary: Color(0xff80d5d4),
        surfaceTint: Color(0xff80d5d4),
        onPrimary: Color(0xff003737),
        primaryContainer: Color(0xff004f50),
        onPrimaryContainer: Color(0xff9cf1f0),
        secondary: Color(0xff9fd49b),
        onSecondary: Color(0xff073911),
        secondaryContainer: Color(0xff215025),
        onSecondaryContainer: Color(0xffbbf0b6),
        tertiary: Color(0xffb0d18b),
        onTertiary: Color(0xff1e3702),
        tertiaryContainer: Color(0xff344e17),
        onTertiaryContainer: Color(0xffcceda5),
        error: Color(0xffffb4a8),
        onError: Color(0xff561e16),
        errorContainer: Color(0xff73342a),
        onErrorContainer: Color(0xffffdad4),
        background: Color(0xff0e1514),
        onBackground: Color(0xffdde4e3),
        surface: Color(0xff0e1514),
        onSurface: Color(0xffdde4e3),
        surfaceVariant: Color(0xff3f4948),
        onSurfaceVariant: Color(0xffbec9c8),
        outline: Color(0xff889392),
        outlineVariant: Color(0xff3f4948),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffdde4e3),
        inverseOnSurface: Color(0xff2b3231),
        inversePrimary: Color(0xff006a6a),
        primaryFixed: Color(0xff9cf1f0),
        onPrimaryFixed: Color(0xff002020),
        primaryFixedDim: Color(0xff80d5d4),
        onPrimaryFixedVariant: Color(0xff004f50),
        secondaryFixed: Color(0xffbbf0b6),
        onSecondaryFixed: Color(0xff002105),
        secondaryFixedDim: Color(0xff9fd49b),
        onSecondaryFixedVariant: Color(0xff215025),
        tertiaryFixed: Color(0xffcceda5),
        onTertiaryFixed: Color(0xff0f2000),
        tertiaryFixedDim: Color(0xffb0d18b),
        onTertiaryFixedVariant: Color(0xff344e17),
        surfaceDim: Color(0xff0e1514),
        surfaceBright: Color(0xff343a3a),
        surfaceContainerLowest: Color(0xff090f0f),
        surfaceContainerLow: Color(0xff161d1d),
        surfaceContainer: Color(0xff1a2121),
        surfaceContainerHigh: Color(0xff252b2b),
        surfaceContainerHighest: Color(0xff2f3636),
      );

  ThemeData dark() => theme(darkScheme().toColorScheme());

  static MaterialScheme darkMediumContrastScheme() => const MaterialScheme(
        brightness: Brightness.dark,
        primary: Color(0xff84d9d8),
        surfaceTint: Color(0xff80d5d4),
        onPrimary: Color(0xff001a1a),
        primaryContainer: Color(0xff479e9d),
        onPrimaryContainer: Color(0xff000000),
        secondary: Color(0xffa3d89f),
        onSecondary: Color(0xff001b04),
        secondaryContainer: Color(0xff6b9d69),
        onSecondaryContainer: Color(0xff000000),
        tertiary: Color(0xffb4d58f),
        onTertiary: Color(0xff0b1a00),
        tertiaryContainer: Color(0xff7b9a5a),
        onTertiaryContainer: Color(0xff000000),
        error: Color(0xffffbaaf),
        onError: Color(0xff330502),
        errorContainer: Color(0xffcc7b6f),
        onErrorContainer: Color(0xff000000),
        background: Color(0xff0e1514),
        onBackground: Color(0xffdde4e3),
        surface: Color(0xff0e1514),
        onSurface: Color(0xfff6fcfb),
        surfaceVariant: Color(0xff3f4948),
        onSurfaceVariant: Color(0xffc2cdcc),
        outline: Color(0xff9ba5a4),
        outlineVariant: Color(0xff7b8585),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffdde4e3),
        inverseOnSurface: Color(0xff252b2b),
        inversePrimary: Color(0xff005151),
        primaryFixed: Color(0xff9cf1f0),
        onPrimaryFixed: Color(0xff001414),
        primaryFixedDim: Color(0xff80d5d4),
        onPrimaryFixedVariant: Color(0xff003d3d),
        secondaryFixed: Color(0xffbbf0b6),
        onSecondaryFixed: Color(0xff001603),
        secondaryFixedDim: Color(0xff9fd49b),
        onSecondaryFixedVariant: Color(0xff0e3f16),
        tertiaryFixed: Color(0xffcceda5),
        onTertiaryFixed: Color(0xff081400),
        tertiaryFixedDim: Color(0xffb0d18b),
        onTertiaryFixedVariant: Color(0xff243d06),
        surfaceDim: Color(0xff0e1514),
        surfaceBright: Color(0xff343a3a),
        surfaceContainerLowest: Color(0xff090f0f),
        surfaceContainerLow: Color(0xff161d1d),
        surfaceContainer: Color(0xff1a2121),
        surfaceContainerHigh: Color(0xff252b2b),
        surfaceContainerHighest: Color(0xff2f3636),
      );

  ThemeData darkMediumContrast() =>
      theme(darkMediumContrastScheme().toColorScheme());

  static MaterialScheme darkHighContrastScheme() => const MaterialScheme(
        brightness: Brightness.dark,
        primary: Color(0xffeafffe),
        surfaceTint: Color(0xff80d5d4),
        onPrimary: Color(0xff000000),
        primaryContainer: Color(0xff84d9d8),
        onPrimaryContainer: Color(0xff000000),
        secondary: Color(0xfff1ffea),
        onSecondary: Color(0xff000000),
        secondaryContainer: Color(0xffa3d89f),
        onSecondaryContainer: Color(0xff000000),
        tertiary: Color(0xfff4ffe0),
        onTertiary: Color(0xff000000),
        tertiaryContainer: Color(0xffb4d58f),
        onTertiaryContainer: Color(0xff000000),
        error: Color(0xfffff9f8),
        onError: Color(0xff000000),
        errorContainer: Color(0xffffbaaf),
        onErrorContainer: Color(0xff000000),
        background: Color(0xff0e1514),
        onBackground: Color(0xffdde4e3),
        surface: Color(0xff0e1514),
        onSurface: Color(0xffffffff),
        surfaceVariant: Color(0xff3f4948),
        onSurfaceVariant: Color(0xfff3fdfc),
        outline: Color(0xffc2cdcc),
        outlineVariant: Color(0xffc2cdcc),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffdde4e3),
        inverseOnSurface: Color(0xff000000),
        inversePrimary: Color(0xff003030),
        primaryFixed: Color(0xffa0f5f5),
        onPrimaryFixed: Color(0xff000000),
        primaryFixedDim: Color(0xff84d9d8),
        onPrimaryFixedVariant: Color(0xff001a1a),
        secondaryFixed: Color(0xffbff5ba),
        onSecondaryFixed: Color(0xff000000),
        secondaryFixedDim: Color(0xffa3d89f),
        onSecondaryFixedVariant: Color(0xff001b04),
        tertiaryFixed: Color(0xffd0f2a9),
        onTertiaryFixed: Color(0xff000000),
        tertiaryFixedDim: Color(0xffb4d58f),
        onTertiaryFixedVariant: Color(0xff0b1a00),
        surfaceDim: Color(0xff0e1514),
        surfaceBright: Color(0xff343a3a),
        surfaceContainerLowest: Color(0xff090f0f),
        surfaceContainerLow: Color(0xff161d1d),
        surfaceContainer: Color(0xff1a2121),
        surfaceContainerHigh: Color(0xff252b2b),
        surfaceContainerHighest: Color(0xff2f3636),
      );

  ThemeData darkHighContrast() =>
      theme(darkHighContrastScheme().toColorScheme());

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  /// Warning
  static const warning = ExtendedColor(
    seed: Color(0xffffff00),
    value: Color(0xffffff00),
    light: ColorFamily(
      color: Color(0xff616118),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffe8e78f),
      onColorContainer: Color(0xff1d1d00),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff616118),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffe8e78f),
      onColorContainer: Color(0xff1d1d00),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff616118),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffe8e78f),
      onColorContainer: Color(0xff1d1d00),
    ),
    dark: ColorFamily(
      color: Color(0xffcbcb76),
      onColor: Color(0xff323200),
      colorContainer: Color(0xff494900),
      onColorContainer: Color(0xffe8e78f),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffcbcb76),
      onColor: Color(0xff323200),
      colorContainer: Color(0xff494900),
      onColorContainer: Color(0xffe8e78f),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffcbcb76),
      onColor: Color(0xff323200),
      colorContainer: Color(0xff494900),
      onColorContainer: Color(0xffe8e78f),
    ),
  );

  List<ExtendedColor> get extendedColors => [
        warning,
      ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() => ColorScheme(
        brightness: brightness,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        background: background,
        onBackground: onBackground,
        surface: surface,
        onSurface: onSurface,
        surfaceVariant: surfaceVariant,
        onSurfaceVariant: onSurfaceVariant,
        outline: outline,
        outlineVariant: outlineVariant,
        shadow: shadow,
        scrim: scrim,
        inverseSurface: inverseSurface,
        onInverseSurface: inverseOnSurface,
        inversePrimary: inversePrimary,
      );
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
