import 'package:freezed_annotation/freezed_annotation.dart';

import '../currency_module/currency.dart';
import '../db/local_db.dart';
import '../shared/app_icon_data.dart';

part 'account_models.freezed.dart';

@freezed
class AccountInfo with _$AccountInfo {
  factory AccountInfo({
    required String? id,
    required String name,
    required BigInt openingBalance,
    required AppCurrency currencyData,
    required AppIconData iconData,
    String description = '',
  }) =>
      AccountInfo._internal(
        id: id,
        name: name,
        currencyInfo: currencyData,
        openingBalance: openingBalance,
        iconInfo: iconData,
        description: description,
      );

  const factory AccountInfo._internal({
    required String? id,
    required String name,
    required AppCurrency currencyInfo,
    required BigInt openingBalance,
    required AppIconData iconInfo,
    @Default('') String description,
  }) = _AccountInfo;

  const AccountInfo._();

  AccountsCompanion get companion => AccountsCompanion.insert(
        id: id!,
        name: name,
        description: description,
        currency: currencyInfo.id,
        openingBalance: openingBalance,
      );
}
