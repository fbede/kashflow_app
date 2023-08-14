import 'package:flutter/material.dart';

import '../core/responsive.dart';
import '../elements/user_text.dart';
import 'other_widgets.dart';

class ResponsiveDialogShell extends StatelessWidget {
  const ResponsiveDialogShell({
    required this.child,
    required this.onSave,
    required this.onCancel,
    required this.isLoading,
    super.key,
  });

  final void Function() onSave;
  final void Function() onCancel;
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (context.isPhone()) {
      return Dialog.fullscreen(
        child: _Shell(
          onSave: onSave,
          onCancel: onCancel,
          isLoading: isLoading,
          child: child,
        ),
      );
    }
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: SizedBox(
        width: 400,
        child: _Shell(
          onSave: onSave,
          onCancel: onCancel,
          isLoading: isLoading,
          child: child,
        ),
      ),
    );
  }
}

class _Shell extends StatelessWidget {
  const _Shell({
    required this.onSave,
    required this.onCancel,
    required this.isLoading,
    required this.child,
  });

  final void Function() onSave;
  final void Function() onCancel;
  final bool isLoading;
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
                    child: const Text(UserText.cancel),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: onSave,
                    child: isLoading
                        ? const CustomProgressIndicator()
                        : const Text(UserText.save),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
