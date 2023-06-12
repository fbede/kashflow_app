import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'config/env.dart';
import 'shared/app.dart';

const _environment = 'Testing';

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
        ..attachScreenshot = true
        ..release = releaseInfo;
    },
    appRunner: () => runApp(
      const ProviderScope(child: SentryScreenshotWidget(child: MyApp())),
    ),
  );
}
