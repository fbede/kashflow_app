import 'package:flutter/material.dart';
import 'package:money2/money2.dart';
import 'package:uuid/v7.dart';

import '../shared/app_icon_data.dart';
import '../shared/db/local_db.dart';
import 'views/account_popup_menu_button.dart';

const _uuid = UuidV7();

class Account {
  late final String id;
  late final AppIconData iconData;

  final String name;
  final String description;
  final String currencyId;
  final Money openingBalance;

  Account({
    required this.name,
    required this.description,
    required this.openingBalance,
    required this.currencyId,
    required this.iconData,
    required this.id,
  });

  Account.create({
    required this.name,
    required this.description,
    required this.openingBalance,
    required this.currencyId,
    required IconData iconData,
    Color? backgroundColor,
    Color? iconColor,
    String? id,
  }) {
    this.id = id ?? _uuid.generate();
    this.iconData = AppIconData.create(
      iconData: iconData,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      id: this.id,
    );
  }

  AccountTableCompanion get companion => AccountTableCompanion.insert(
        id: id,
        name: name,
        currency: currencyId,
        description: description,
        openingBalance: openingBalance.minorUnits,
      );

  Widget buildListTile(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.only(left: 16, right: 8),
        leading: iconData.buildAvatar(context),
        title: Text(name),
        subtitle: Text(openingBalance.toString()),
        trailing: AccountListTileMenuButton(account: this),
        onTap: () {},
      );

  @override
  String toString() => '''

Account:
  id:$id
  name: $name
  currencyId: $currencyId
  openingBalance: $openingBalance''';
}
