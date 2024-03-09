import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow_core/kashflow_core.dart';

class AppProviderObserver extends ProviderObserver {
  final logger = Logger.I;

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.log('''
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
    logger.handle(
      error,
      stackTrace,
      '''
${provider.name}
Threw: $error
At: $stackTrace''',
    );
  }
}
