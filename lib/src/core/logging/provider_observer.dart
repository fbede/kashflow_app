import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'log_handler.dart';

class AppProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    talker.log('''
${provider.name}
Updated from: $previousValue
Updated to: $newValue''');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    talker.handle(
      error,
      stackTrace,
      '''
${provider.name}
Threw: $error
At: $stackTrace''',
    );
  }
}
