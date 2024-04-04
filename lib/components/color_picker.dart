import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

import '../shared/responsive.dart';
import '../ui_elements/user_text.dart';

Future<Color> showColorPicker(BuildContext context, [Color? color]) async =>
    showColorPickerDialog(
      context,
      color ?? context.colorScheme.primary,
      pickersEnabled: {
        ColorPickerType.both: true,
        ColorPickerType.accent: false,
        ColorPickerType.primary: false,
      },
      showRecentColors: true,
      titlePadding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
      actionsPadding: const EdgeInsets.all(16),
      dialogTitle: const Text(UserText.selectColor),
      subheading: const Text(UserText.shade),
      recentColorsSubheading: const Text(UserText.recent),
    );
