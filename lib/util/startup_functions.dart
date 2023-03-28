import 'dart:ffi' as ffi;
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
