// ignore_for_file: unused_element

import 'package:drift/drift.dart' hide JsonKey;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';

import '../shared/local_db.dart';
import '../shared/models/shared_models.dart';
import 'account_popup_menu_button.dart';

part 'account_models.freezed.dart';

@freezed
class AccountInfo with _$AccountInfo {
  const factory AccountInfo({
    required String name,
    required Money openingBalance,
    required IconInfo iconInfo,
    @Default('') String description,
    int? id,
  }) = _AccountInfo;

  const AccountInfo._();

  AccountsCompanion toTableCompanion() => AccountsCompanion.insert(
        name: name,
        description: description,
        currency: openingBalance.currency.code,
        openingBalance: openingBalance.minorUnits,
        iconCodePoint: iconInfo.iconData.codePoint,
        iconMatchesTextDirection: iconInfo.iconData.matchTextDirection,
        iconFontFamily: Value(iconInfo.iconData.fontFamily),
        iconFontPackage: Value(iconInfo.iconData.fontPackage),
        iconColorValue: iconInfo.iconColor.value,
        backgroundColorValue: iconInfo.backgroundColor.value,
      );

  ListTile toListTile() => ListTile(
        contentPadding: const EdgeInsets.only(left: 16, right: 16),
        leading: iconInfo.toAvatar(),
        title: Text(name),
        subtitle: Text(openingBalance.toString()),
        trailing: AccountListTileMenuButton(accountInfo: this),
        onTap: () {},
      );
}
