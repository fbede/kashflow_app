import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.freezed.dart';

part 'settings_provider.g.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required Currency currency,
  }) = _SettingsState;
}

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  SettingsState build() => SettingsState(currency: CommonCurrencies().usd);
}
