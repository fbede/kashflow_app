import 'package:flutter/material.dart';

import '../../icons/icons.dart';
import '../accounts.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({required this.data, super.key});

  final AccountViewDTO data;

  @override
  Widget build(BuildContext context) {
    final iconAvatarData = IconAvatarData(
      iconData: data.iconData,
      iconColor: data.iconColor,
      backgroundColor: data.backgroundColor,
    );

    return ListTile(
      contentPadding: const EdgeInsets.only(left: 16, right: 8),
      leading: IconAvatar(data: iconAvatarData),
      title: Text(data.name),
      subtitle: Text(data.openingBalance.toString()),
      trailing: AccountListTileMenuButton(account: data),
      onTap: () {},
    );
  }
}
