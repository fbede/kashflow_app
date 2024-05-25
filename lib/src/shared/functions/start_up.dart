import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import '../../core/core.dart';

Future<String> getReleaseInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();
  final appName = packageInfo.appName;
  final version = packageInfo.version;
  final String buildNumber = packageInfo.buildNumber;
  return '$appName $version+$buildNumber';
}

Future<void> setWindowSettings() async {
  if (kIsWeb) {
    return;
  }
  if (Platform.isAndroid || Platform.isIOS) {
    return;
  }
  await windowManager.ensureInitialized();

  if (DartDefine.flavor == Flavor.development) {
    const windowOptions = WindowOptions(
      size: Size(360, 640),
      minimumSize: Size(360, 640),
      alwaysOnTop: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );

    await windowManager.waitUntilReadyToShow(
      windowOptions,
      () async {
        await windowManager.show();
        await windowManager.focus();
      },
    );
  } else {
    await windowManager.waitUntilReadyToShow(
      null,
      () async {
        await windowManager.show();
        await windowManager.focus();
      },
    );
  }
}

Future<void> registerSingletons() async {
  final prefs = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(prefs);
}

void registerFontLicenses() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/Poppins/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('assets/fonts/Noto_Sans/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('assets/fonts/LucideIcons/License.txt');
    yield LicenseEntryWithLineBreaks(['Lucide License'], license);
  });
}
