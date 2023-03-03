import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/util/startup_functions.dart';

import 'app.dart';

//TODO: Update from main_dev

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //setupDB();

  //Handles intial splashscreen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Registers models e.g Shared Preferences on get_it
  await registerModelsOnGetIt();

  runApp(ProviderScope(child: const MyApp()));
}
