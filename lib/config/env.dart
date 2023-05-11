// ignore_for_file: avoid_classes_with_only_static_members

import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'SENTRY_DSN', obfuscate: true)
  static final sentryDsn = _Env.sentryDsn;
}
