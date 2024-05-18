import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:go_router/go_router.dart';
import '../src/shared/extensions/build_context_extensions.dart';
import '../user_text.dart.old';

Future<double> showCalculator(BuildContext context) async {
  double result = 0;

  await showModalBottomSheet<Widget>(
    context: context,
    isScrollControlled: true,
    builder: (_) => _CalculatorWidget(
      onChanged: (value) => result = value,
    ),
  );

  return result;
}

class _CalculatorWidget extends StatefulWidget {
  const _CalculatorWidget({required this.onChanged});

  final ValueChanged<double> onChanged;

  @override
  State<_CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<_CalculatorWidget> {
  String text = '';
  double answer = 0;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: SimpleCalculator(
                hideSurroundingBorder: true,
                maximumDigits: 20,
                onChanged: _onChanged,
                theme: _getCalculatorTheme(context),
              ),
            ),
            const SizedBox(height: 8),
            _buildFooter(),
            const SizedBox(height: 8),
          ],
        ),
      );

  void _onChanged(String? key, double? value, String? expression) {
    text = expression ?? '';
    if (key == '=') {
      answer = value ?? 0;
    }
    setState(() {});
  }

  Padding _buildFooter() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text(UserText.cancel),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                widget.onChanged(answer);
                context.pop();
              },
              child: const Text(UserText.done),
            ),
          ],
        ),
      );

  CalculatorThemeData _getCalculatorTheme(BuildContext context) {
    final bodyStyle = context.textTheme.titleLarge;
    return CalculatorThemeData(
      operatorColor: context.colorScheme.primary,
      numColor: context.colorScheme.surface,
      displayStyle: context.textTheme.displaySmall,
      expressionStyle: bodyStyle,
      operatorStyle: bodyStyle?.copyWith(color: context.colorScheme.onPrimary),
      numStyle: bodyStyle?.copyWith(color: context.colorScheme.onSurface),
      commandStyle:
          bodyStyle?.copyWith(color: context.colorScheme.onBackground),
    );
  }
}

final amountFieldFormatters = [
  FilteringTextInputFormatter.allow(RegExp('[0-9.-]')),
  TextInputFormatter.withFunction((oldValue, newValue) {
    try {
      final text = newValue.text;
      if (text.isNotEmpty) {
        double.parse(text);
      }
      return newValue;
    } on Exception catch (_) {}
    return oldValue;
  }),
];
