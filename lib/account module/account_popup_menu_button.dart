import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/account%20module/account_models.dart';
import 'package:kashflow/account%20module/account_provider.dart';
import 'package:kashflow/account%20module/edit_account_view.dart';
import 'package:kashflow/shared/responsive.dart';
import 'package:kashflow/shared/user_text.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
  final notLoadingIcon = Icon(PhosphorIcons.regular.dotsThreeVertical);

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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(PhosphorIcons.regular.pencilSimpleLine),
                const SizedBox(width: 8),
                const Text(UserText.edit)
              ],
            ),
          ),
          PopupMenuItem(
            onTap: _delete,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(PhosphorIcons.regular.trashSimple),
                const SizedBox(width: 8),
                const Text(UserText.delete)
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

    await ref
        .read(accountsProvider.notifier)
        .deleteAccount(widget.accountInfo.id!);
  }
}
