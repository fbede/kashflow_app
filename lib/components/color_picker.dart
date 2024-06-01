import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../src/shared/extensions/build_context_extensions.dart';

Future<Color?> showColorPicker(BuildContext context, [Color? color]) async {
  Color pickerColor = Color(0xff443a49);
  Color currentColor = color ?? Color(0xff443a49);

  void changeColor(Color color) {
    pickerColor = color;
  }

  return showDialog<Color>(
    builder: (context) => AlertDialog(
      title: const Text(
        'Pick a color!',
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        // Use Material color picker:
        //
        // child: MaterialPicker(
        //   pickerColor: pickerColor,
        //   onColorChanged: changeColor,
        //   // showLabel: true, // only on portrait mode
        // ),
        //
        // Use Block color picker:
        //
        child: BlockPicker(
          pickerColor: currentColor,
          onColorChanged: changeColor,
        ),
        //
        // child: MultipleChoiceBlockPicker(
        //   pickerColors: currentColors,
        //   onColorsChanged: changeColors,
        // ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Got it'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
    context: context,
  );
}
