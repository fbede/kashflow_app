import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

import '../../../core/core.dart';
import '../../currency/currency.dart';

class Account {
  final String id;
  final String name;
  final String description;
  final CurrencyTableData currencyData;
  final AssetIconTableData iconData;
  final Color? iconColor;
  final Color? backgroundColor;
  final Money openingBalance;

  Account({
    required AccountTableData accountData,
    required this.currencyData,
    required this.iconData,
  })  : id = accountData.id,
        name = accountData.name,
        description = accountData.description,
        openingBalance = Money.fromBigIntWithCurrency(
          accountData.openingBalance,
          currencyData.currency,
        ),
        backgroundColor = accountData.backgroundColor,
        iconColor = accountData.iconColor;

  AccountTableCompanion get companion => AccountTableCompanion.insert(
        id: Value(id),
        name: name,
        currency: currencyData.id,
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
  currencyId: ${currencyData.id}
  openingBalance: $openingBalance
  \n''';
}
