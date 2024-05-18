import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../components/calculator.dart';
import '../../core/core.dart' hide Icon;
import '../modules/icons/icons.dart';

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({
    required this.controller,
    required this.showSuffix,
    super.key,
  });

  final TextEditingController controller;
  final bool showSuffix;

  @override
  Widget build(BuildContext context) {
    final text = context.t.shared.widgets.custom_text_fields;
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      minLines: 1,
      maxLines: 5,
      maxLength: 100,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: const Icon(RemixIcons.align_justify),
        labelText: text.description,
        suffixIcon: showSuffix
            ? null
            : IconButton(
                onPressed: controller.clear,
                icon: const Icon(RemixIcons.close_circle_fill),
              ),
      ),
    );
  }
}

class MoneyAmountFormField extends StatelessWidget {
  const MoneyAmountFormField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final text = context.t.shared.widgets.custom_text_fields;
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      inputFormatters: _getInputFormatters(),
      textAlign: TextAlign.end,
      decoration: InputDecoration(
        isDense: true,
        labelText: text.amount,
        prefixIcon: const Icon(RemixIcons.coin_line),
        suffixIcon: IconButton(
          icon: const Icon(RemixIcons.calculator_line),
          onPressed: () async => _onAmountTap(context),
        ),
      ),
    );
  }

  Future<void> _onAmountTap(BuildContext context) async {
    final result = await showCalculator(context);
    controller.text = result.toString();
  }

  List<TextInputFormatter> _getInputFormatters() => [
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
          prefixIcon: const Icon(RemixIcons.pencil_line),
          labelText: label,
        ),
        validator: (x) => _validator(context, x),
      );

  String? _validator(BuildContext ctx, String? input) {
    final text = ctx.t.shared.widgets.custom_text_fields;

    if (input == null || input.isEmpty) {
      return text.cannot_be_empty;
    }
    if (input.length < 3) {
      return text.too_short;
    }

    return null;
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final hintText = context.t.shared.widgets.custom_text_fields.search;

    return TextField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsetsDirectional.zero,
        prefixIcon: const Icon(RemixIcons.search_2_line),
        hintText: hintText,
      ),
    );
  }
}
