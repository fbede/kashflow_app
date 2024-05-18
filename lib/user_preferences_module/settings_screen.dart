import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../currency_module/currency_picker_dialog.dart';
import '../src/app/currency/providers/currency_provider.dart';
import '../src/shared/modules/icons/icons.dart';
import '../src/shared/extensions/build_context_extensions.dart';
import '../src/core/logging/log_handler.dart';
import '../src/core/routing/route_names.dart';
import '../user_text.dart.old';
import 'settings_screen_components.dart';
import 'theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar.large(title: Text(UserText.homeNavBarSettings)),
            SliverList(
              delegate: SliverChildListDelegate(const [
                _ThemeListTile(),
                _CategoriesListTile(),
                _DefaultCurrencyListTile(),
                _ManageCurrenciesListTile(),
              ]),
            ),
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
    final themeMode = ref.watch(themeProvider).themeMode;

    switch (themeMode) {
      case ThemeMode.light:
        return const Icon(RemixIcons.sun_line);

      case ThemeMode.dark:
        return const Icon(RemixIcons.moon_clear_line);

      case ThemeMode.system:
        return const Icon(RemixIcons.computer_line);
    }
  }

  Text _buildSubTitle(WidgetRef ref) {
    final themeMode = ref.watch(themeProvider).themeMode;

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

class _CategoriesListTile extends ConsumerWidget {
  const _CategoriesListTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListTile(
        leading: const Icon(RemixIcons.survey_line),
        title: const Text(UserText.manageCategories),
        onTap: () async => context.pushNamed(Routes.manageCategories),
      );
}

class _DefaultCurrencyListTile extends ConsumerWidget {
  const _DefaultCurrencyListTile()
      : super(key: const ValueKey('defaultCurrencyListTile'));

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(defaultCurrencyProvider).when(
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
            data: (data) => ListTile(
              leading: _buildIcon(context, data.symbol),
              title: const Text(UserText.defaultCurrency),
              subtitle: Text(data.name),
              onTap: () async => onTap(context, ref),
            ),
          );

  Future<void> onTap(BuildContext context, WidgetRef ref) async {
    final currency = await showCurrencyPicker(context, '');
    if (currency != null) {
      try {
        await ref
            .read(defaultCurrencyProvider.notifier)
            .setDefaultCurrency(currency.id);
      } on Exception catch (e, s) {
        talker.handle(e, s);
      }
    }
  }

  Widget _buildIcon(BuildContext context, String symbol) {
    late final Text text;
    final symbols = symbol.split(',');

    final textStyle = context.textTheme.titleLarge;

    if (symbols.isNotEmpty) {
      text = Text(symbols[0], style: textStyle);
    } else {
      text = Text(symbol, style: textStyle);
    }

    return SizedBox.square(dimension: 24, child: Center(child: text));
  }
}

class _ManageCurrenciesListTile extends ConsumerWidget {
  const _ManageCurrenciesListTile()
      : super(key: const ValueKey('manageCurrenciesListTile'));

  @override
  Widget build(BuildContext context, WidgetRef ref) => Visibility(
        visible: false,
        child: ref.watch(defaultCurrencyProvider).when(
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
              data: (data) => ListTile(
                leading: SizedBox.square(
                  dimension: 24,
                  child: Center(
                    child: Text(
                      data.code,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                title: const Text(UserText.manageCurrencies),
                subtitle: Text(data.name),
                //  onTap: () async => onTap(context, ref),
              ),
            ),
      );
}
