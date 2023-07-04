import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/shared/core/responsive.dart';
import 'package:kashflow/shared/elements/user_text.dart';

Future<double> showCalculator(BuildContext context) async {
  double result = 0;

  await showGeneralDialog<Widget>(
    context: context,
    pageBuilder: (context, _, __) => _CalculatorWidget(
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
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  Text('Result: $answer'),
                  const SizedBox(height: 8),
                  Text(text),
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: SimpleCalculator(
                      hideSurroundingBorder: true,
                      hideExpression: true,
                      onChanged: _onChanged,
                      theme: getCalculatorTheme(context),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildFooter(),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
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

  CalculatorThemeData getCalculatorTheme(BuildContext context) =>
      CalculatorThemeData(
        displayStyle: const TextStyle(fontSize: 14),
        expressionStyle: const TextStyle(fontSize: 14),
        operatorStyle: TextStyle(
          fontSize: 14,
          color: context.theme().colorScheme.onPrimary,
        ),
        commandStyle: TextStyle(
          fontSize: 14,
          color: context.theme().colorScheme.onBackground,
        ),
        numStyle: TextStyle(
          fontSize: 14,
          color: context.theme().colorScheme.onBackground,
        ),
      );
}

final amountFieldFormatters = [
  FilteringTextInputFormatter.allow(RegExp('[0-9.-]')),
  TextInputFormatter.withFunction((oldValue, newValue) {
    try {
      final text = newValue.text;
      if (text.isNotEmpty) double.parse(text);
      return newValue;
    } on Exception catch (_) {}
    return oldValue;
  }),
];
