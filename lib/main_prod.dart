import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/shared/components/app.dart';
import 'package:kashflow/shared/config/env.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
