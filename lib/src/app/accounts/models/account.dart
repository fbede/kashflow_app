import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

import '../../../core/core.dart';
import '../../currency/currency.dart';

class Account {
  final String id;
  final String name;
  final String description;
  final String currencyId;
  final AssetIconTableData iconData;
  final Color? iconColor;
  final Color? backgroundColor;
  final Money openingBalance;

  Account({
    required AccountTableData accountData,
    required CurrencyTableData currencyData,
    required this.iconData,
  })  : id = accountData.id,
        name = accountData.name,
        description = accountData.description,
        currencyId = currencyData.id,
        openingBalance = Money.fromBigIntWithCurrency(
          accountData.openingBalance,
          currencyData.currency,
        ),
        backgroundColor = accountData.backgroundColor,
        iconColor = accountData.iconColor;

  AccountTableCompanion get companion => AccountTableCompanion.insert(
        id: Value(id),
        name: name,
        currency: currencyId,
        description: description,
        openingBalance: openingBalance.minorUnits,
        icon: iconData.name,
      );

  @override
  String toString() => '''
\n
Account:
  id:$id
  name: $name
  currencyId: $currencyId
  openingBalance: $openingBalance
  \n''';
}
