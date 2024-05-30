// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'material_scheme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MaterialSchemeTailorMixin on ThemeExtension<MaterialScheme> {
  Brightness get brightness;
  Color get primary;
  Color get surfaceTint;
  Color get onPrimary;
  Color get primaryContainer;
  Color get onPrimaryContainer;
  Color get secondary;
  Color get onSecondary;
  Color get secondaryContainer;
  Color get onSecondaryContainer;
  Color get tertiary;
  Color get onTertiary;
  Color get tertiaryContainer;
  Color get onTertiaryContainer;
  Color get error;
  Color get onError;
  Color get errorContainer;
  Color get onErrorContainer;
  Color get background;
  Color get onBackground;
  Color get surface;
  Color get onSurface;
  Color get surfaceVariant;
  Color get onSurfaceVariant;
  Color get outline;
  Color get outlineVariant;
  Color get shadow;
  Color get scrim;
  Color get inverseSurface;
  Color get inverseOnSurface;
  Color get inversePrimary;
  Color get primaryFixed;
  Color get onPrimaryFixed;
  Color get primaryFixedDim;
  Color get onPrimaryFixedVariant;
  Color get secondaryFixed;
  Color get onSecondaryFixed;
  Color get secondaryFixedDim;
  Color get onSecondaryFixedVariant;
  Color get tertiaryFixed;
  Color get onTertiaryFixed;
  Color get tertiaryFixedDim;
  Color get onTertiaryFixedVariant;
  Color get surfaceDim;
  Color get surfaceBright;
  Color get surfaceContainerLowest;
  Color get surfaceContainerLow;
  Color get surfaceContainer;
  Color get surfaceContainerHigh;
  Color get surfaceContainerHighest;

  @override
  MaterialScheme copyWith({
    Brightness? brightness,
    Color? primary,
    Color? surfaceTint,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? inverseOnSurface,
    Color? inversePrimary,
    Color? primaryFixed,
    Color? onPrimaryFixed,
    Color? primaryFixedDim,
    Color? onPrimaryFixedVariant,
    Color? secondaryFixed,
    Color? onSecondaryFixed,
    Color? secondaryFixedDim,
    Color? onSecondaryFixedVariant,
    Color? tertiaryFixed,
    Color? onTertiaryFixed,
    Color? tertiaryFixedDim,
    Color? onTertiaryFixedVariant,
    Color? surfaceDim,
    Color? surfaceBright,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
  }) {
    return MaterialScheme(
      brightness: brightness ?? this.brightness,
      primary: primary ?? this.primary,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      shadow: shadow ?? this.shadow,
      scrim: scrim ?? this.scrim,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      inverseOnSurface: inverseOnSurface ?? this.inverseOnSurface,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      primaryFixed: primaryFixed ?? this.primaryFixed,
      onPrimaryFixed: onPrimaryFixed ?? this.onPrimaryFixed,
      primaryFixedDim: primaryFixedDim ?? this.primaryFixedDim,
      onPrimaryFixedVariant:
          onPrimaryFixedVariant ?? this.onPrimaryFixedVariant,
      secondaryFixed: secondaryFixed ?? this.secondaryFixed,
      onSecondaryFixed: onSecondaryFixed ?? this.onSecondaryFixed,
      secondaryFixedDim: secondaryFixedDim ?? this.secondaryFixedDim,
      onSecondaryFixedVariant:
          onSecondaryFixedVariant ?? this.onSecondaryFixedVariant,
      tertiaryFixed: tertiaryFixed ?? this.tertiaryFixed,
      onTertiaryFixed: onTertiaryFixed ?? this.onTertiaryFixed,
      tertiaryFixedDim: tertiaryFixedDim ?? this.tertiaryFixedDim,
      onTertiaryFixedVariant:
          onTertiaryFixedVariant ?? this.onTertiaryFixedVariant,
      surfaceDim: surfaceDim ?? this.surfaceDim,
      surfaceBright: surfaceBright ?? this.surfaceBright,
      surfaceContainerLowest:
          surfaceContainerLowest ?? this.surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainerHighest:
          surfaceContainerHighest ?? this.surfaceContainerHighest,
    );
  }

  @override
  MaterialScheme lerp(
      covariant ThemeExtension<MaterialScheme>? other, double t) {
    if (other is! MaterialScheme) return this as MaterialScheme;
    return MaterialScheme(
      brightness: t < 0.5 ? brightness : other.brightness,
      primary: Color.lerp(primary, other.primary, t)!,
      surfaceTint: Color.lerp(surfaceTint, other.surfaceTint, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer:
          Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimaryContainer:
          Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      secondaryContainer:
          Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
      onSecondaryContainer:
          Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      tertiaryContainer:
          Color.lerp(tertiaryContainer, other.tertiaryContainer, t)!,
      onTertiaryContainer:
          Color.lerp(onTertiaryContainer, other.onTertiaryContainer, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer:
          Color.lerp(onErrorContainer, other.onErrorContainer, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      onSurfaceVariant:
          Color.lerp(onSurfaceVariant, other.onSurfaceVariant, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      outlineVariant: Color.lerp(outlineVariant, other.outlineVariant, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
      inverseSurface: Color.lerp(inverseSurface, other.inverseSurface, t)!,
      inverseOnSurface:
          Color.lerp(inverseOnSurface, other.inverseOnSurface, t)!,
      inversePrimary: Color.lerp(inversePrimary, other.inversePrimary, t)!,
      primaryFixed: Color.lerp(primaryFixed, other.primaryFixed, t)!,
      onPrimaryFixed: Color.lerp(onPrimaryFixed, other.onPrimaryFixed, t)!,
      primaryFixedDim: Color.lerp(primaryFixedDim, other.primaryFixedDim, t)!,
      onPrimaryFixedVariant:
          Color.lerp(onPrimaryFixedVariant, other.onPrimaryFixedVariant, t)!,
      secondaryFixed: Color.lerp(secondaryFixed, other.secondaryFixed, t)!,
      onSecondaryFixed:
          Color.lerp(onSecondaryFixed, other.onSecondaryFixed, t)!,
      secondaryFixedDim:
          Color.lerp(secondaryFixedDim, other.secondaryFixedDim, t)!,
      onSecondaryFixedVariant: Color.lerp(
          onSecondaryFixedVariant, other.onSecondaryFixedVariant, t)!,
      tertiaryFixed: Color.lerp(tertiaryFixed, other.tertiaryFixed, t)!,
      onTertiaryFixed: Color.lerp(onTertiaryFixed, other.onTertiaryFixed, t)!,
      tertiaryFixedDim:
          Color.lerp(tertiaryFixedDim, other.tertiaryFixedDim, t)!,
      onTertiaryFixedVariant:
          Color.lerp(onTertiaryFixedVariant, other.onTertiaryFixedVariant, t)!,
      surfaceDim: Color.lerp(surfaceDim, other.surfaceDim, t)!,
      surfaceBright: Color.lerp(surfaceBright, other.surfaceBright, t)!,
      surfaceContainerLowest:
          Color.lerp(surfaceContainerLowest, other.surfaceContainerLowest, t)!,
      surfaceContainerLow:
          Color.lerp(surfaceContainerLow, other.surfaceContainerLow, t)!,
      surfaceContainer:
          Color.lerp(surfaceContainer, other.surfaceContainer, t)!,
      surfaceContainerHigh:
          Color.lerp(surfaceContainerHigh, other.surfaceContainerHigh, t)!,
      surfaceContainerHighest: Color.lerp(
          surfaceContainerHighest, other.surfaceContainerHighest, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MaterialScheme &&
            const DeepCollectionEquality()
                .equals(brightness, other.brightness) &&
            const DeepCollectionEquality().equals(primary, other.primary) &&
            const DeepCollectionEquality()
                .equals(surfaceTint, other.surfaceTint) &&
            const DeepCollectionEquality().equals(onPrimary, other.onPrimary) &&
            const DeepCollectionEquality()
                .equals(primaryContainer, other.primaryContainer) &&
            const DeepCollectionEquality()
                .equals(onPrimaryContainer, other.onPrimaryContainer) &&
            const DeepCollectionEquality().equals(secondary, other.secondary) &&
            const DeepCollectionEquality()
                .equals(onSecondary, other.onSecondary) &&
            const DeepCollectionEquality()
                .equals(secondaryContainer, other.secondaryContainer) &&
            const DeepCollectionEquality()
                .equals(onSecondaryContainer, other.onSecondaryContainer) &&
            const DeepCollectionEquality().equals(tertiary, other.tertiary) &&
            const DeepCollectionEquality()
                .equals(onTertiary, other.onTertiary) &&
            const DeepCollectionEquality()
                .equals(tertiaryContainer, other.tertiaryContainer) &&
            const DeepCollectionEquality()
                .equals(onTertiaryContainer, other.onTertiaryContainer) &&
            const DeepCollectionEquality().equals(error, other.error) &&
            const DeepCollectionEquality().equals(onError, other.onError) &&
            const DeepCollectionEquality()
                .equals(errorContainer, other.errorContainer) &&
            const DeepCollectionEquality()
                .equals(onErrorContainer, other.onErrorContainer) &&
            const DeepCollectionEquality()
                .equals(background, other.background) &&
            const DeepCollectionEquality()
                .equals(onBackground, other.onBackground) &&
            const DeepCollectionEquality().equals(surface, other.surface) &&
            const DeepCollectionEquality().equals(onSurface, other.onSurface) &&
            const DeepCollectionEquality()
                .equals(surfaceVariant, other.surfaceVariant) &&
            const DeepCollectionEquality()
                .equals(onSurfaceVariant, other.onSurfaceVariant) &&
            const DeepCollectionEquality().equals(outline, other.outline) &&
            const DeepCollectionEquality()
                .equals(outlineVariant, other.outlineVariant) &&
            const DeepCollectionEquality().equals(shadow, other.shadow) &&
            const DeepCollectionEquality().equals(scrim, other.scrim) &&
            const DeepCollectionEquality()
                .equals(inverseSurface, other.inverseSurface) &&
            const DeepCollectionEquality()
                .equals(inverseOnSurface, other.inverseOnSurface) &&
            const DeepCollectionEquality()
                .equals(inversePrimary, other.inversePrimary) &&
            const DeepCollectionEquality()
                .equals(primaryFixed, other.primaryFixed) &&
            const DeepCollectionEquality()
                .equals(onPrimaryFixed, other.onPrimaryFixed) &&
            const DeepCollectionEquality()
                .equals(primaryFixedDim, other.primaryFixedDim) &&
            const DeepCollectionEquality()
                .equals(onPrimaryFixedVariant, other.onPrimaryFixedVariant) &&
            const DeepCollectionEquality()
                .equals(secondaryFixed, other.secondaryFixed) &&
            const DeepCollectionEquality()
                .equals(onSecondaryFixed, other.onSecondaryFixed) &&
            const DeepCollectionEquality()
                .equals(secondaryFixedDim, other.secondaryFixedDim) &&
            const DeepCollectionEquality().equals(
                onSecondaryFixedVariant, other.onSecondaryFixedVariant) &&
            const DeepCollectionEquality()
                .equals(tertiaryFixed, other.tertiaryFixed) &&
            const DeepCollectionEquality()
                .equals(onTertiaryFixed, other.onTertiaryFixed) &&
            const DeepCollectionEquality()
                .equals(tertiaryFixedDim, other.tertiaryFixedDim) &&
            const DeepCollectionEquality()
                .equals(onTertiaryFixedVariant, other.onTertiaryFixedVariant) &&
            const DeepCollectionEquality()
                .equals(surfaceDim, other.surfaceDim) &&
            const DeepCollectionEquality()
                .equals(surfaceBright, other.surfaceBright) &&
            const DeepCollectionEquality()
                .equals(surfaceContainerLowest, other.surfaceContainerLowest) &&
            const DeepCollectionEquality()
                .equals(surfaceContainerLow, other.surfaceContainerLow) &&
            const DeepCollectionEquality()
                .equals(surfaceContainer, other.surfaceContainer) &&
            const DeepCollectionEquality()
                .equals(surfaceContainerHigh, other.surfaceContainerHigh) &&
            const DeepCollectionEquality().equals(
                surfaceContainerHighest, other.surfaceContainerHighest));
  }

  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(brightness),
      const DeepCollectionEquality().hash(primary),
      const DeepCollectionEquality().hash(surfaceTint),
      const DeepCollectionEquality().hash(onPrimary),
      const DeepCollectionEquality().hash(primaryContainer),
      const DeepCollectionEquality().hash(onPrimaryContainer),
      const DeepCollectionEquality().hash(secondary),
      const DeepCollectionEquality().hash(onSecondary),
      const DeepCollectionEquality().hash(secondaryContainer),
      const DeepCollectionEquality().hash(onSecondaryContainer),
      const DeepCollectionEquality().hash(tertiary),
      const DeepCollectionEquality().hash(onTertiary),
      const DeepCollectionEquality().hash(tertiaryContainer),
      const DeepCollectionEquality().hash(onTertiaryContainer),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(onError),
      const DeepCollectionEquality().hash(errorContainer),
      const DeepCollectionEquality().hash(onErrorContainer),
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(onBackground),
      const DeepCollectionEquality().hash(surface),
      const DeepCollectionEquality().hash(onSurface),
      const DeepCollectionEquality().hash(surfaceVariant),
      const DeepCollectionEquality().hash(onSurfaceVariant),
      const DeepCollectionEquality().hash(outline),
      const DeepCollectionEquality().hash(outlineVariant),
      const DeepCollectionEquality().hash(shadow),
      const DeepCollectionEquality().hash(scrim),
      const DeepCollectionEquality().hash(inverseSurface),
      const DeepCollectionEquality().hash(inverseOnSurface),
      const DeepCollectionEquality().hash(inversePrimary),
      const DeepCollectionEquality().hash(primaryFixed),
      const DeepCollectionEquality().hash(onPrimaryFixed),
      const DeepCollectionEquality().hash(primaryFixedDim),
      const DeepCollectionEquality().hash(onPrimaryFixedVariant),
      const DeepCollectionEquality().hash(secondaryFixed),
      const DeepCollectionEquality().hash(onSecondaryFixed),
      const DeepCollectionEquality().hash(secondaryFixedDim),
      const DeepCollectionEquality().hash(onSecondaryFixedVariant),
      const DeepCollectionEquality().hash(tertiaryFixed),
      const DeepCollectionEquality().hash(onTertiaryFixed),
      const DeepCollectionEquality().hash(tertiaryFixedDim),
      const DeepCollectionEquality().hash(onTertiaryFixedVariant),
      const DeepCollectionEquality().hash(surfaceDim),
      const DeepCollectionEquality().hash(surfaceBright),
      const DeepCollectionEquality().hash(surfaceContainerLowest),
      const DeepCollectionEquality().hash(surfaceContainerLow),
      const DeepCollectionEquality().hash(surfaceContainer),
      const DeepCollectionEquality().hash(surfaceContainerHigh),
      const DeepCollectionEquality().hash(surfaceContainerHighest),
    ]);
  }
}

extension MaterialSchemeBuildContext on BuildContext {
  MaterialScheme get materialScheme =>
      Theme.of(this).extension<MaterialScheme>()!;
}
