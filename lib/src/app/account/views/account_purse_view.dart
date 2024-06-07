import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/core.dart';
import '../../../shared/extensions/build_context_extensions.dart';
import '../../../shared/widgets/custom_progress_indicator.dart';
import '../../app.dart';

class AccountPurseView extends ConsumerWidget {
  const AccountPurseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(accountsProvider).when(
            loading: () => const Center(child: CustomProgressIndicator()),
            error: (e, s) => Center(child: Text('$e\n$s')),
            data: (data) {
              if (data.isEmpty) {
                return const _NoAccount();
              }

              return ListView.builder(
                padding: const EdgeInsets.only(top: 4),
                itemCount: data.length,
                itemBuilder: (ctx, index) => AccountListTile(data: data[index]),
              );
            },
          );
}

class _NoAccount extends StatelessWidget {
  const _NoAccount();

  @override
  Widget build(BuildContext context) {
    final text = context.t.account_module;
    return Padding(
      padding: const EdgeInsets.all(32),
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: LayoutBuilder(
                builder: (context, constraints) => Center(
                  child: Icon(
                    LucideIcons.packageOpen,
                    size: constraints.maxWidth / 2,
                    color: context.colorScheme.onSurface.withOpacity(0.1),
                  ),
                ),
              ),
            ),
            Text(text.nothing_here, style: context.textTheme.headlineBold),
            const SizedBox(height: 16),
            Text(text.create_a_new_account_text, textAlign: TextAlign.center),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
