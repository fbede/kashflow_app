import 'package:flutter/material.dart';
import 'package:kashflow/shared/core/responsive.dart';

class ResponsiveDialogShell extends StatelessWidget {
  const ResponsiveDialogShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (context.isPhone()) {
      return Dialog.fullscreen(child: child);
    }
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: SizedBox(width: 400, child: child),
    );
  }
}
