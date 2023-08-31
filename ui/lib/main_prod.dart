import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow_core/kashflow_core.dart';

import 'components/app.dart';
import 'config/env.dart';
import 'core/start_up.dart';

const _environment = 'Production';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final [releaseInfo as String, _] = await Future.wait([
    getReleaseInfo(),
    registerSingletons(),
  ]);

  logger.log(releaseInfo);

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = Env.sentryDsn
        ..environment = _environment
        ..tracesSampleRate = 1.0
        ..release = releaseInfo;
    },
    appRunner: () => runApp(const ProviderScope(child: MyApp())),
  );
}
