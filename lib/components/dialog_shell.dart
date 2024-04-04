import 'package:flutter/material.dart';

import '../shared/responsive.dart';
import '../ui_elements/user_text.dart';
import 'other_widgets.dart';

class ResponsiveDialogShell extends _Shell {
  const ResponsiveDialogShell({
    required super.child,
    required super.onSave,
    required super.onCancel,
    required super.saveIsLoading,
    required super.cancelIsLoading,
    super.onSaveText = UserText.save,
    super.onCancelText = UserText.cancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isPhone()) {
      return Dialog.fullscreen(child: super.build(context));
    }
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: SizedBox(width: 400, child: super.build(context)),
    );
  }
}

class _Shell extends StatelessWidget {
  const _Shell({
    required this.onSave,
    required this.onCancel,
    required this.saveIsLoading,
    required this.cancelIsLoading,
    required this.child,
    required this.onSaveText,
    required this.onCancelText,
    super.key,
  });

  final void Function() onSave;
  final void Function() onCancel;
  final String onSaveText;
  final String onCancelText;
  final bool saveIsLoading;
  final bool cancelIsLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: context.colorScheme.error),
                      foregroundColor: context.colorScheme.error,
                    ),
                    child: cancelIsLoading
                        ? const CustomProgressIndicator()
                        : Text(onCancelText),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: onSave,
                    child: saveIsLoading
                        ? const CustomProgressIndicator()
                        : Text(onSaveText),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
