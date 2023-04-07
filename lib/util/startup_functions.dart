import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db/drift_db.dart';

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
