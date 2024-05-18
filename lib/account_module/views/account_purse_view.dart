import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../src/shared/widgets/custom_progress_indicator.dart';
import '../../src/app/currency/providers/currency_provider.dart';
import '../../src/shared/modules/icons/icons.dart';
import '../../user_text.dart.old';
import '../account_provider.dart';
import 'ui_functions.dart';

class AccountPurseView extends ConsumerWidget {
  const AccountPurseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(accountProvider).when(
            loading: () => const Center(child: CustomProgressIndicator()),
            error: (e, s) => Center(child: Text('$e\n$s')),
            data: (data) {
              if (data.isEmpty) {
                return const _AddNewAccountButton();
              }

              return ListView.builder(
                padding: const EdgeInsets.only(top: 4),
                itemCount: data.length + 1,
                itemBuilder: (ctx, index) {
                  if (index < data.length) {
                    return data[index].buildListTile(ctx);
                  }
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: _AddNewAccountButton(),
                  );
                },
              );
            },
          );
}

class _AddNewAccountButton extends ConsumerWidget {
  const _AddNewAccountButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(defaultCurrencyProvider).when(
            error: (e, s) => Center(child: Text('$e\n$s')),
            loading: () => const Center(child: CustomProgressIndicator()),
            data: (data) => Center(
              child: ElevatedButton.icon(
                onPressed: () async => openCreateAccount(context, data),
                icon: const Icon(RemixIcons.wallet_3_line),
                label: const Text(UserText.addNewAccount),
              ),
            ),
          );
}
