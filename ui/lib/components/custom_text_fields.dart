import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../currency_module/currency_picker_dialog.dart';
import '../ui_elements/user_text.dart';
import 'calculator.dart';

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({
    required this.controller,
    required this.showSuffix,
    super.key,
  });

  final TextEditingController controller;
  final bool showSuffix;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        textCapitalization: TextCapitalization.sentences,
        minLines: 1,
        maxLines: 5,
        maxLength: 100,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(PhosphorIcons.regular.textAlignLeft),
          labelText: UserText.description,
          suffixIcon: showSuffix
              ? null
              : IconButton(
                  onPressed: controller.clear,
                  icon: Icon(PhosphorIcons.fill.xCircle),
                ),
        ),
      );
}

class MoneyAmountFormField extends StatelessWidget {
  const MoneyAmountFormField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(
          signed: true,
          decimal: true,
        ),
        inputFormatters: _getInputFormatters(),
        textAlign: TextAlign.end,
        decoration: InputDecoration(
          isDense: true,
          labelText: UserText.amount,
          prefixIcon: Icon(PhosphorIcons.regular.coins),
          suffixIcon: IconButton(
            icon: Icon(PhosphorIcons.regular.calculator),
            onPressed: () async => _onAmountTap(context),
          ),
        ),
      );

  Future<void> _onAmountTap(BuildContext context) async {
    final result = await showCalculator(context);
    controller.text = result.toString();
  }

  List<TextInputFormatter> _getInputFormatters() => [
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
}

class CurrencyFormField extends StatelessWidget {
  const CurrencyFormField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        showCursor: false,
        onTap: () async => _onCurrencyTap(context),
        decoration: InputDecoration(
          isDense: true,
          labelText: UserText.currency,
          prefixIcon: Icon(PhosphorIcons.regular.money),
        ),
        validator: _validator,
      );

  String? _validator(String? v) {
    if (v == null || v.isEmpty) {
      return UserText.cannotBeEmpty;
    }
    return null;
  }

  Future<void> _onCurrencyTap(BuildContext context) async {
    final result = await showCurrencyPicker(context);
    late String text;

    if (result == null) {
      text = '';
    } else {
      text = '${result.name} (${result.code})';
    }

    controller.text = text.trim();
  }
}

class NameFormField extends StatelessWidget {
  const NameFormField({
    required this.controller,
    required this.label,
    super.key,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.words,
        maxLength: 25,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(PhosphorIcons.regular.pencilSimpleLine),
          labelText: label,
        ),
        validator: _validator,
      );

  String? _validator(String? input) {
    if (input == null || input.isEmpty) {
      return UserText.cannotBeEmpty;
    }
    if (input.length < 3) {
      return UserText.tooShort;
    }

    return null;
  }
}
