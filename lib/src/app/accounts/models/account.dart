import 'package:money2/money2.dart';

import '../../../core/core.dart';
import '../../currency/currency.dart';

class AccountOld {
  final String id;
  final String name;
  final String description;
  final String currencyId;
  final IconTableData iconData;
  final Money openingBalance;

  AccountOld({
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
        );

  AccountTableCompanion get companion => AccountTableCompanion.insert(
        id: id,
        name: name,
        currency: currencyId,
        description: description,
        openingBalance: openingBalance.minorUnits,
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
