import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';
import '../../../shared.dart';

part 'asset_icon_provider.g.dart';

@riverpod
Future<List<AssetIconTableData>> assetIcon(
  AssetIconRef ref,
  AssetIconQuery query,
) async {
  final interactor = AssetIconInteractor();
  return interactor.fetchIcons(query);
}

@riverpod
Future<AssetIconTableData> defaultAccountIcon(DefaultAccountIconRef ref) async {
  final interactor = AssetIconInteractor();
  return interactor.defaultAccountIcon;
}
