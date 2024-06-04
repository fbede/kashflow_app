import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

import '../../../core/core.dart';
import '../../currency/extensions/extensions.dart';

class CreateAccountDTO {
  String accountName;
  String iconName;
  Fixed amount;
  String currencyId;
  String description;
  Color? iconColor;
  Color? backgroundColor;

  CreateAccountDTO({
    required this.accountName,
    required this.iconName,
    required this.amount,
    required this.currencyId,
    required this.description,
    required this.iconColor,
    required this.backgroundColor,
  });

  AccountTableCompanion get companion => AccountTableCompanion.insert(
        name: accountName,
        currency: currencyId,
        description: description,
        openingBalance: amount.minorUnits,
        icon: iconName,
        iconColor: Value(iconColor),
        backgroundColor: Value(backgroundColor),
      );
}

class EditAccountDTO extends CreateAccountDTO {
  String id;

  EditAccountDTO({
    required this.id,
    required super.accountName,
    required super.iconName,
    required super.amount,
    required super.currencyId,
    required super.description,
    required super.iconColor,
    required super.backgroundColor,
  });

  @override
  AccountTableCompanion get companion =>
      super.companion.copyWith(id: Value(id));
}

class AccountViewDTO {
  final String id;
  final String name;
  final String description;
  final CurrencyTableData currencyData;
  final AssetIconTableData iconData;
  final Color? iconColor;
  final Color? backgroundColor;
  final Money openingBalance;

  AccountViewDTO({
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
Account:
  id:$id
  name: $name
  currencyId: ${currencyData.id}
  openingBalance: $openingBalance
  \n''';
}
