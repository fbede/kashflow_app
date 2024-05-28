import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core.dart';
import '../../../core/db/db.dart';
import '../../../shared/shared.dart';
import '../../accounts/accounts.dart';
import '../../currency/currency.dart';

part 'home_fab_provider.g.dart';

typedef HomeScreenFABData = ({
  int numOfAccounts,
  AssetIconTableData icon,
  CurrencyTableData? currency
});

@riverpod
Future<HomeScreenFABData> homeScreenFABData(HomeScreenFABDataRef ref) async {
  final accounts = await ref.watch(accountProvider.future);
  final icon = await ref.watch(defaultAccountIconProvider.future);
  final currency = await ref.watch(defaultCurrencyProvider.future);
  return (numOfAccounts: accounts.length, icon: icon, currency: currency);
}
