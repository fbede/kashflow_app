import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

import '../../../core/core.dart';

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
