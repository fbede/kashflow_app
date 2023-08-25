// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:kashflow_core/kashflow_core.dart';
import 'account_popup_menu_button.dart';

extension AccountInfoExtension on AccountInfo {
  ListTile get listTile => ListTile(
        contentPadding: const EdgeInsets.only(left: 16, right: 16),
        leading: iconInfo.avatar,
        title: Text(name),
        subtitle: Text(openingBalance.toString()),
        trailing: AccountListTileMenuButton(accountInfo: this),
        onTap: () {},
      );
}
