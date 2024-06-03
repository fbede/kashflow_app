import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/translations/translations.dart';
import '../shared.dart';

class SaveOrCancelButtonBar extends StatelessWidget {
  const SaveOrCancelButtonBar({
    required this.onSave,
    required this.saveIsLoading,
    super.key,
  });

  final void Function() onSave;
  final bool saveIsLoading;

  @override
  Widget build(BuildContext context) {
    final userText = context.t.shared.widgets.save_or_cancel_button_bar;
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: context.pop,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: context.colorScheme.error),
              foregroundColor: context.colorScheme.error,
            ),
            child: Text(userText.cancel),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: FilledButton(
            onPressed: onSave,
            child: saveIsLoading
                ? const CustomProgressIndicator()
                : Text(userText.save),
          ),
        ),
      ],
    );
  }
}
