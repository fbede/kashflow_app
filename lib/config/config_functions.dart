// ignore_for_file: do_not_use_environment

enum RuntimeEnv { development, testing, production }

final _environmentNotSet = Exception('Runtime Environment was not Set');

RuntimeEnv getRuntimeEnvironment() {
  try {
    const arg = String.fromEnvironment('env');

    switch (arg) {
      case 'dev':
        return RuntimeEnv.development;
      case 'test':
        return RuntimeEnv.testing;
      case 'prod':
        return RuntimeEnv.production;
      default:
        throw _environmentNotSet;
    }
  } on Exception catch (_) {
    throw _environmentNotSet;
  }
}
