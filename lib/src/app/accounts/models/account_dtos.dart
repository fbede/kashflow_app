import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CreateAccountDTO {
  String accountName;
  String iconName;
  BigInt amount;
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
        openingBalance: amount,
        icon: iconName,
        iconColor: Value(iconColor),
        backgroundColor: Value(backgroundColor),
      );
}
