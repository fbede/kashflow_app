import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../currency module/currency_picker_dialog.dart';
import '../shared/user_text.dart';
import 'settings_screen_components.dart';
import 'theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(title: const Text(UserText.homeNavBarSettings)),
            SliverList(
              delegate: SliverChildListDelegate(const [
                _ThemeListTile(),
                _DefaultCurrencyListTile(),
              ]),
            )
          ],
        ),
      );
}

class _ThemeListTile extends ConsumerWidget {
  const _ThemeListTile() : super(key: const ValueKey('themeListTile'));

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListTile(
        leading: _buildIcon(ref),
        title: const Text(UserText.theme),
        subtitle: _buildSubTitle(ref),
        onTap: () async => showDialog(
          context: context,
          builder: (_) => const ChangeThemeDialog(),
        ),
      );

  Icon _buildIcon(WidgetRef ref) {
    final themeMode = ref.watch(themesProvider).themeMode;

    switch (themeMode) {
      case ThemeMode.light:
        return Icon(PhosphorIcons.fill.lightbulb);

      case ThemeMode.dark:
        return Icon(PhosphorIcons.fill.moon);

      case ThemeMode.system:
        return Icon(PhosphorIcons.fill.devices);
    }
  }

  Text _buildSubTitle(WidgetRef ref) {
    final themeMode = ref.watch(themesProvider).themeMode;

    switch (themeMode) {
      case ThemeMode.light:
        return const Text(UserText.light);

      case ThemeMode.dark:
        return const Text(UserText.dark);

      case ThemeMode.system:
        return const Text(UserText.system);
    }
  }
}

class _DefaultCurrencyListTile extends ConsumerWidget {
  const _DefaultCurrencyListTile()
      : super(key: const ValueKey('defaultCurrencyListTile'));

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListTile(
        leading: _buildIcon(ref),
        title: const Text(UserText.defaultCurrency),
        subtitle: _buildSubTitle(ref),
        onTap: () async {
          final Currency result = await showCurrencyPicker(context: context);
        },
      );

  Icon _buildIcon(WidgetRef ref) {
    final themeMode = ref.watch(themesProvider).themeMode;

    switch (themeMode) {
      case ThemeMode.light:
        return Icon(PhosphorIcons.fill.lightbulb);

      case ThemeMode.dark:
        return Icon(PhosphorIcons.fill.moon);

      case ThemeMode.system:
        return Icon(PhosphorIcons.fill.devices);
    }
  }

  Text _buildSubTitle(WidgetRef ref) {
    final themeMode = ref.watch(themesProvider).themeMode;

    switch (themeMode) {
      case ThemeMode.light:
        return const Text(UserText.light);

      case ThemeMode.dark:
        return const Text(UserText.dark);

      case ThemeMode.system:
        return const Text(UserText.system);
    }
  }
}
