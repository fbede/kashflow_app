import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';
import '../../../shared.dart';

part 'asset_icon_provider.g.dart';

@riverpod
Stream<List<AssetIconTableData>> assetIcon(
  AssetIconRef ref,
  String searchTerm, {
  AssetIconInteractor? currencyInteractor,
}) async* {
  final interactor = currencyInteractor ?? AssetIconInteractor();
  yield* interactor.watchIcons(searchTerm);
}

@riverpod
Future<AssetIconTableData> defaultAccountIcon(
  DefaultAccountIconRef ref, {
  AssetIconInteractor? currencyInteractor,
}) async {
  final interactor = currencyInteractor ?? AssetIconInteractor();
  return interactor.defaultAccountIcon;
}
