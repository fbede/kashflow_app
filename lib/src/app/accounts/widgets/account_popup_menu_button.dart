import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  late final notLoadingIcon = Assets.lucide.ellipsisVertical.svg(
    theme: context.svgTheme(),
  );
  late final editIcon = Assets.lucide.penLine.svg(theme: context.svgTheme());
  late final deleteIcon = Assets.lucide.trash2.svg(theme: context.svgTheme());
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
                editIcon,
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
                deleteIcon,
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
