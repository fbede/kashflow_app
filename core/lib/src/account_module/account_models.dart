// ignore_for_file: unused_element

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';

import '../db/local_db.dart';
import '../models/shared_models.dart';

part 'account_models.freezed.dart';

@freezed
class AccountInfo with _$AccountInfo {
  factory AccountInfo({
    required String? id,
    required String name,
    required Money openingBalance,
    required IconInfo iconInfo,
    String description = '',
  }) {
    final icon = iconInfo.copyWith(id: id);
    return AccountInfo._internal(
      id: id,
      name: name,
      openingBalance: openingBalance,
      iconInfo: icon,
      description: description,
    );
  }

  const factory AccountInfo._internal({
    required String? id,
    required String name,
    required Money openingBalance,
    required IconInfo iconInfo,
    @Default('') String description,
  }) = _AccountInfo;

  const AccountInfo._();

  AccountsCompanion get companion => AccountsCompanion.insert(
        id: id!,
        name: name,
        description: description,
        currency: openingBalance.currency.code,
        openingBalance: openingBalance.minorUnits,
      );
}
