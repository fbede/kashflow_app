// ignore_for_file: unused_element

import 'package:freezed_annotation/freezed_annotation.dart';

import '../db/local_db.dart';
import '../models/shared_models.dart';

part 'account_models.freezed.dart';

@freezed
class AccountInfo with _$AccountInfo {
  factory AccountInfo({
    required String? id,
    required String name,
    required BigInt openingBalance,
    required CurrencyTableData currencyData,
    required IconInfo iconInfo,
    String description = '',
  }) {
    final icon = iconInfo.copyWith(id: id);
    return AccountInfo._internal(
      id: id,
      name: name,
      currencyInfo: currencyData,
      openingBalance: openingBalance,
      iconInfo: icon,
      description: description,
    );
  }

  const factory AccountInfo._internal({
    required String? id,
    required String name,
    required CurrencyTableData currencyInfo,
    required BigInt openingBalance,
    required IconInfo iconInfo,
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
