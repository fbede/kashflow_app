import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/core.dart';
import '../../../shared/extensions/extensions.dart';
import '../../app.dart' as a;

class ThemeModeListTile extends StatelessWidget {
  const ThemeModeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.t.appearance;
    final textTheme = context.textTheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const _Leading(),
      title: Text(
        text.theme_mode,
        style: textTheme.bodyBold,
      ),
      subtitle: const _Subtitle(),
      onTap: () async => context.pushNamed(Routes.selectThemeMode),
    );
  }
}

class _Leading extends ConsumerWidget {
  const _Leading();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(a.themeModeProvider);
    return switch (themeMode) {
      ThemeMode.dark => const Icon(LucideIcons.moon),
      ThemeMode.light => const Icon(LucideIcons.sun),
      ThemeMode.system => const Icon(LucideIcons.computer),
    };
  }
}

class _Subtitle extends ConsumerWidget {
  const _Subtitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(a.themeModeProvider);
    final text = context.t.appearance;
    return switch (themeMode) {
      ThemeMode.dark => Text(text.dark_mode),
      ThemeMode.light => Text(text.light_mode),
      ThemeMode.system => Text(text.system),
    };
  }
}
