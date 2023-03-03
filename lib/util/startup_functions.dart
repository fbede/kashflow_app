import 'dart:convert';
import 'dart:ffi' as ffi;
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';
import 'package:sqlite3/open.dart';
import '../db/drift_db.dart';

setupDB() {
  open
    ..overrideFor(
        OperatingSystem.linux, () => ffi.DynamicLibrary.open('sqlite3.so'))
    ..overrideFor(
        OperatingSystem.windows, () => ffi.DynamicLibrary.open('sqlite3.dll'));
}

Future<void> registerModelsOnGetIt() async {
  final db = DriftDB();
  //Register SharedPreferences
  GetIt.I.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  //Register Drift Database
  GetIt.I.registerSingleton<DriftDB>(db);

  ///Register Preloaded Currencies
  // GetIt.I.registerSingleton<List<PreloadedCurrencyData>>(
  // await _getPreloadedCurriences(),
  //);
}

///Registers licenses for fonts and others
void registerLicenses() {
  //Registers font license
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}

///Preloads preloaded currencies
Future<List<PreloadedCurrencyData>> _getPreloadedCurriences() async {
  final String json =
      await rootBundle.loadString('assets/json/loaded_currencies.json');

  var data = jsonDecode(json) as List;
  print(data);

  return data.map((e) => PreloadedCurrencyData.fromJson(e)).toList();
}
