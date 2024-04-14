import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/other_widgets.dart';
import '../icons_module/icons.dart';
import '../shared/extensions/build_context_extensions.dart';
import '../ui_elements/user_text.dart';
import 'account.dart';
import 'account_provider.dart' hide Account;
//import 'edit_account_view.dart.old';

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
  final notLoadingIcon = const Icon(RemixIcons.more_2_fill);

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
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(RemixIcons.edit_2_line),
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
                Icon(RemixIcons.delete_bin_6_line),
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
    await ref
        .watch(accountProvider.notifier)
        .deleteAccount(widget.account.name);
  }
}
