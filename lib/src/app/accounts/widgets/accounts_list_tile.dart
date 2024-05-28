import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../accounts.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({required this.data, super.key});

  final AccountOld data;

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.only(left: 16, right: 8),
        leading: IconAvatar(data: data.iconData),
        title: Text(data.name),
        subtitle: Text(data.openingBalance.toString()),
        trailing: AccountListTileMenuButton(account: data),
        onTap: () {},
      );
}
