import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow_core/kashflow_core.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'shared/components/app.dart';
import 'shared/config/env.dart';

const _environment = 'Production';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final packageInfo = await PackageInfo.fromPlatform();
  final appName = packageInfo.appName;
  final version = packageInfo.version;
  final String buildNumber = packageInfo.buildNumber;
  final releaseInfo = '$appName $version+$buildNumber';

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
