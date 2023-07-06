part of 'account_dao.dart';

Money _getMoneyFromResult({
  required TypedResult result,
  required $AccountsTable accountsTable,
  required $CurrencyTableTable currencyTable,
}) {
  final currency = result.readTable(currencyTable).toCurrency();
  final amount = result.read(accountsTable.openingBalance)!;
  return Money.fromBigIntWithCurrency(amount, currency);
}

IconInfo _getIconInfoFromResult({
  required TypedResult result,
  required $AccountsTable accountsTable,
}) {
  final iconCodePoint = result.read(accountsTable.iconCodePoint)!;
  final iconFamily = result.read(accountsTable.iconFontFamily)!;
  final iconPackage = result.read(accountsTable.iconFontPackage)!;
  final iconMatchesTextDirection =
      result.read(accountsTable.iconMatchesTextDirection)!;
  final iconColor = Color(result.read(accountsTable.iconColorValue)!);
  final backgroundColor =
      Color(result.read(accountsTable.backgroundColorValue)!);
  final iconData = IconData(
    iconCodePoint,
    fontFamily: iconFamily,
    fontPackage: iconPackage,
    matchTextDirection: iconMatchesTextDirection,
  );
  return IconInfo(
    iconData: iconData,
    iconColor: iconColor,
    backgroundColor: backgroundColor,
  );
}
