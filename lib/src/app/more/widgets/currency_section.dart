import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../../app.dart';

const currencySection = [_CurrencySectionTitle(), _CurrencySection()];

class _CurrencySection extends StatelessWidget {
  const _CurrencySection();

  @override
  Widget build(BuildContext context) => SliverList.list(
        children: const [
          _CurrencySettingsListTile(),
        ],
      );
}

class _CurrencySectionTitle extends StatelessWidget {
  const _CurrencySectionTitle();

  @override
  Widget build(BuildContext context) {
    final text = context.t.currency_module.currency;
    final textTheme = context.textTheme;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(text, style: textTheme.labelBold),
      ),
    );
  }
}

class _CurrencySettingsListTile extends StatelessWidget {
  const _CurrencySettingsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.t.currency_module.default_currency;
    final textTheme = context.textTheme;
    return ListTile(
      leading: const Icon(LucideIcons.circleDollarSign),
      title: Text(text, style: textTheme.bodyBold),
      subtitle: const _Subtitle(),
      onTap: () async => context.pushNamed(Routes.defaultCurrency),
    );
  }
}

class _Subtitle extends ConsumerWidget {
  const _Subtitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(defaultCurrencyProvider).when(
            data: (data) => Text(data?.name ?? ''),
            error: (e, s) => Text('$e, $s'),
            loading: () => const Text(''),
          );
}
