import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'material_scheme.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class MaterialScheme extends ThemeExtension<MaterialScheme>
    with _$MaterialSchemeTailorMixin {
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

  @override
  final Brightness brightness;
  @override
  final Color primary;
  @override
  final Color surfaceTint;
  @override
  final Color onPrimary;
  @override
  final Color primaryContainer;
  @override
  final Color onPrimaryContainer;
  @override
  final Color secondary;
  @override
  final Color onSecondary;
  @override
  final Color secondaryContainer;
  @override
  final Color onSecondaryContainer;
  @override
  final Color tertiary;
  @override
  final Color onTertiary;
  @override
  final Color tertiaryContainer;
  @override
  final Color onTertiaryContainer;
  @override
  final Color error;
  @override
  final Color onError;
  @override
  final Color errorContainer;
  @override
  final Color onErrorContainer;
  @override
  final Color background;
  @override
  final Color onBackground;
  @override
  final Color surface;
  @override
  final Color onSurface;
  @override
  final Color surfaceVariant;
  @override
  final Color onSurfaceVariant;
  @override
  final Color outline;
  @override
  final Color outlineVariant;
  @override
  final Color shadow;
  @override
  final Color scrim;
  @override
  final Color inverseSurface;
  @override
  final Color inverseOnSurface;
  @override
  final Color inversePrimary;
  @override
  final Color primaryFixed;
  @override
  final Color onPrimaryFixed;
  @override
  final Color primaryFixedDim;
  @override
  final Color onPrimaryFixedVariant;
  @override
  final Color secondaryFixed;
  @override
  final Color onSecondaryFixed;
  @override
  final Color secondaryFixedDim;
  @override
  final Color onSecondaryFixedVariant;
  @override
  final Color tertiaryFixed;
  @override
  final Color onTertiaryFixed;
  @override
  final Color tertiaryFixedDim;
  @override
  final Color onTertiaryFixedVariant;
  @override
  final Color surfaceDim;
  @override
  final Color surfaceBright;
  @override
  final Color surfaceContainerLowest;
  @override
  final Color surfaceContainerLow;
  @override
  final Color surfaceContainer;
  @override
  final Color surfaceContainerHigh;
  @override
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
