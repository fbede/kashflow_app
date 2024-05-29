import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core.dart';
import '../../../core/db/db.dart';
import '../../../shared/shared.dart';
import '../../currency/currency.dart';

part 'home_fab_provider.g.dart';

typedef HomeScreenFABData = ({
  AssetIconTableData icon,
  CurrencyTableData? currency
});

@riverpod
Future<HomeScreenFABData> homeScreenFABData(HomeScreenFABDataRef ref) async {
  final icon = await ref.watch(defaultAccountIconProvider.future);
  final currency = await ref.watch(defaultCurrencyProvider.future);
  return (icon: icon, currency: currency);
}
