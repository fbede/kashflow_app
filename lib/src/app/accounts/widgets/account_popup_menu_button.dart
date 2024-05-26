import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../models/account.dart';

class AccountListTileMenuButton extends ConsumerStatefulWidget {
  const AccountListTileMenuButton({
    required this.account,
    super.key,
  });

  final Account account;

  @override
  ConsumerState<AccountListTileMenuButton> createState() =>
      _AccountListTileMenuButtonState();
}

class _AccountListTileMenuButtonState
    extends ConsumerState<AccountListTileMenuButton> {
  final loadingIcon = const CustomProgressIndicator();
  final notLoadingIcon = const Icon(LucideIcons.ellipsisVertical);

  late final userText = context.t.account_module.account_popup_menu_button;
  late Widget icon;

  @override
  void initState() {
    icon = notLoadingIcon;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => PopupMenuButton<void>(
        padding: EdgeInsets.zero,
        icon: icon,
        itemBuilder: (_) => [
          PopupMenuItem(
            onTap: _onEdit,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(LucideIcons.penLine),
                const SizedBox(width: 8),
                Text(userText.edit),
              ],
            ),
          ),
          PopupMenuItem(
            onTap: _delete,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(LucideIcons.trash2),
                const SizedBox(width: 8),
                Text(
                  userText.delete,
                ),
              ],
            ),
          ),
        ],
      );

  Future<void> _onEdit() async => showDialog(
        context: context,
        builder: (context) {
          if (context.isPhone) {
            return Dialog.fullscreen(
                child:
                    SizedBox() /*  EditAccountView(
                account: widget.account,
              ),*/
                );
          } else {
            return Dialog(
              child: SizedBox(
                width: 400,
                /* child: EditAccountView(
                  account: widget.account,
                ), */
              ),
            );
          }
        },
      );

  Future<void> _delete() async {
    icon = loadingIcon;
    setState(() {});

//TODO: Wrap with try catch
    // await ref
    //     .watch(accountProvider.notifier)
    //     .deleteAccount(widget.account.name);
  }
}
