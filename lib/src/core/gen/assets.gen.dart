/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsI18nGen {
  const $AssetsI18nGen();

  /// File path: assets/i18n/strings.i18n.json
  String get stringsI18n => 'assets/i18n/strings.i18n.json';

  /// List of all assets
  List<String> get values => [stringsI18n];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/launcher_icon.png
  AssetGenImage get launcherIcon =>
      const AssetGenImage('assets/images/launcher_icon.png');

  /// File path: assets/images/launcher_icon_3.png
  AssetGenImage get launcherIcon3 =>
      const AssetGenImage('assets/images/launcher_icon_3.png');

  /// List of all assets
  List<AssetGenImage> get values => [appLogo, launcherIcon, launcherIcon3];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/loaded_currencies.json
  String get loadedCurrencies => 'assets/json/loaded_currencies.json';

  /// List of all assets
  List<String> get values => [loadedCurrencies];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/assets_and_liabilities.svg
  SvgGenImage get assetsAndLiabilities =>
      const SvgGenImage('assets/svg/assets_and_liabilities.svg');

  /// File path: assets/svg/coming_soon.svg
  SvgGenImage get comingSoon => const SvgGenImage('assets/svg/coming_soon.svg');

  /// File path: assets/svg/daily_transactions.svg
  SvgGenImage get dailyTransactions =>
      const SvgGenImage('assets/svg/daily_transactions.svg');

  /// File path: assets/svg/income_expense.svg
  SvgGenImage get incomeExpense =>
      const SvgGenImage('assets/svg/income_expense.svg');

  /// File path: assets/svg/nothing.svg
  SvgGenImage get nothing => const SvgGenImage('assets/svg/nothing.svg');

  /// File path: assets/svg/spinner.svg
  SvgGenImage get spinner => const SvgGenImage('assets/svg/spinner.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        assetsAndLiabilities,
        comingSoon,
        dailyTransactions,
        incomeExpense,
        nothing,
        spinner
      ];
}

class Assets {
  Assets._();

  static const $AssetsI18nGen i18n = $AssetsI18nGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
