import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/app.dart';
import 'core/start_up.dart';

//const _environment = 'Development';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([setWindowSettings(), registerSingletons()]);

  runApp(const ProviderScope(child: MyApp()));
}
