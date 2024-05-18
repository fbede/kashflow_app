import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

import '../src/shared/extensions/build_context_extensions.dart';
import '../user_text.dart.old';

Future<Color> showColorPicker(BuildContext context, [Color? color]) async =>
    showColorPickerDialog(
      context,
      color ?? context.colorScheme.primary,
      pickersEnabled: {
        ColorPickerType.both: true,
        ColorPickerType.bw: true,
        ColorPickerType.wheel: true,
        ColorPickerType.accent: false,
        ColorPickerType.custom: false,
        ColorPickerType.primary: false,
      },
      pickerTypeLabels: {
        ColorPickerType.both: UserText.recommended,
        ColorPickerType.bw: UserText.blackAndWhite,
        ColorPickerType.wheel: UserText.any,
      },
      enableTonalPalette: true,
      showColorCode: true,
      showRecentColors: true,
      includeIndex850: true,
      enableOpacity: true,
      showColorName: true,
      titlePadding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
      actionsPadding: const EdgeInsets.all(16),
      dialogTitle: Text(
        UserText.selectColor,
        textAlign: TextAlign.center,
        style: context.textTheme.headlineMedium,
      ),
      subheading: Text(UserText.shade, style: context.textTheme.bodyLarge),
      recentColorsSubheading:
          Text(UserText.recent, style: context.textTheme.bodyLarge),
      selectedPickerTypeColor: color,
      actionButtons: const ColorPickerActionButtons(useRootNavigator: false),
    );
