import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../extensions/build_context_extensions.dart';

Future<Color?> showColorPicker(BuildContext context, [Color? color]) async {
  Color? pickerColor;
  final blackAndWhite = [Colors.black, Colors.white];
  final primaryColors = Colors.primaries.map((e) => Color(e.value)).toList();
  final accentColors = Colors.accents.map((e) => Color(e.value)).toList();
  final availableColors = (blackAndWhite + primaryColors + accentColors)
    ..sort((x, y) => x.value.compareTo(y.value) * -1);

  await showDialog<Color>(
    context: context,
    builder: (context) {
      final text = context.t.icon_module;
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text.pick_a_color,
                textAlign: TextAlign.center,
                style: context.textTheme.titleBold,
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                child: BlockPicker(
                  pickerColor: color ?? context.colorScheme.primary,
                  onColorChanged: (value) {
                    pickerColor = value;
                    context.pop();
                  },
                  availableColors: availableColors,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  return pickerColor;
}
