import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'config/env.dart';
import 'shared/app.dart';

const _environment = 'Testing';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options
        ..dsn = Env.sentryDsn
        ..environment = _environment
        ..tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const ProviderScope(child: MyApp())),
  );
}
