import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:kashflow/db/db.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import '../models/models.dart';

Future<void> setWindowSettings() async {
  if (kIsWeb) return;
  if (Platform.isAndroid || Platform.isIOS) return;
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    minimumSize: Size(400, 600),
    //TODO: ADD ALWAYS ON TOP TO SETTINGS
    alwaysOnTop: true,
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(
    windowOptions,
    () async {
      await windowManager.show();
      await windowManager.focus();
    },
  );
}

Future<void> registerModelsOnGetIt() async {
  //Register SharedPreferences
  GetIt.I.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  //Register Popular Currencies
  GetIt.I
      .registerSingleton<List<PopularCurrency>>(await _getPopularCurrencies());

  //Register Drift Database
  GetIt.I.registerSingleton<DriftDB>(DriftDB());
}

void registerLicenses() {
  //Registers font license
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}

Future<List<PopularCurrency>> _getPopularCurrencies() async {
  final String json =
      await rootBundle.loadString('assets/json/loaded_currencies.json');

  var data = jsonDecode(json) as List;

  List<PopularCurrency> currencies =
      data.map((e) => PopularCurrency.fromJson(e)).toList();

  return currencies;
}
