import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow_core/kashflow_core.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../components/other_widgets.dart';
import '../core/responsive.dart';
import '../ui_elements/user_text.dart';
import 'account_provider.dart';
import 'edit_account_view.dart';

class AccountListTileMenuButton extends ConsumerStatefulWidget {
  const AccountListTileMenuButton({
    required this.accountInfo,
    super.key,
  });

  final AccountInfo accountInfo;

  @override
  ConsumerState<AccountListTileMenuButton> createState() =>
      _AccountListTileMenuButtonState();
}

class _AccountListTileMenuButtonState
    extends ConsumerState<AccountListTileMenuButton> {
  final loadingIcon = const CustomProgressIndicator();
  final notLoadingIcon = const Icon(PhosphorIconsRegular.dotsThreeVertical);

  late Widget icon;

  @override
  void initState() {
    icon = notLoadingIcon;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => PopupMenuButton<void>(
        icon: icon,
        itemBuilder: (_) => [
          PopupMenuItem(
            onTap: _onEdit,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(PhosphorIconsRegular.pencilSimpleLine),
                SizedBox(width: 8),
                Text(UserText.edit),
              ],
            ),
          ),
          PopupMenuItem(
            onTap: _delete,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(PhosphorIconsRegular.trashSimple),
                SizedBox(width: 8),
                Text(UserText.delete),
              ],
            ),
          ),
        ],
      );

  Future<void> _onEdit() async => showDialog(
        context: context,
        builder: (context) {
          if (context.isPhone()) {
            return Dialog.fullscreen(
              child: EditAccountView(
                accountInfo: widget.accountInfo,
              ),
            );
          } else {
            return Dialog(
              child: SizedBox(
                width: 400,
                child: EditAccountView(
                  accountInfo: widget.accountInfo,
                ),
              ),
            );
          }
        },
      );

  Future<void> _delete() async {
    icon = loadingIcon;
    setState(() {});

//TODO: Wrap with try catch
    await ref
        .read(accountsProvider.notifier)
        .deleteAccount(widget.accountInfo.name);
  }
}
