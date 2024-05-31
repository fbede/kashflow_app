import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:go_router/go_router.dart';
import '../../core/core.dart';
import '../extensions/build_context_extensions.dart';

Future<double> showCalculator(BuildContext context) async {
  double result = 0;

  await showModalBottomSheet<Widget>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(),
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
  final _controller = CalcController(maximumDigits: 20);

  String _lastKey = '';
  double _answer = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: AspectRatio(
          aspectRatio: 1,
          child: SimpleCalculator(
            controller: _controller,
            hideSurroundingBorder: true,
            maximumDigits: 20,
            onChanged: _onChanged,
            theme: _getCalculatorTheme(),
          ),
        ),
      );

  void _onChanged(String? key, double? value, String? expression) {
    if (_lastKey == '=' && key == '=') {
      _controller.setValue(_answer);
      widget.onChanged(_answer);
      context.pop();
    }
    if (key == '=') {
      _answer = value ?? 0;
    }
    _lastKey = key ?? '';
    setState(() {});
  }

  CalculatorThemeData _getCalculatorTheme() {
    final bodyStyle = context.textTheme.bodyNormal;
    final headlineStyle = context.textTheme.headlineNormal;
    return CalculatorThemeData(
      operatorColor: context.colorScheme.primary,
      numColor: context.colorScheme.surface,
      displayStyle: headlineStyle.copyWith(height: 1),
      expressionStyle: bodyStyle.copyWith(height: 1),
      operatorStyle:
          headlineStyle.copyWith(color: context.colorScheme.onPrimary),
      numStyle: headlineStyle.copyWith(color: context.colorScheme.onSurface),
      commandStyle:
          headlineStyle.copyWith(color: context.colorScheme.onSurface),
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
