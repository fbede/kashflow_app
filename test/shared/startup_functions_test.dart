import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:kashflow/shared/startup_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test(
    'Tests that the models are registered on get it',
    () async {
      SharedPreferences.setMockInitialValues({});
      await registerModelsOnGetIt();
      final isRegistered = GetIt.I.isRegistered<SharedPreferences>();
      expect(true, isRegistered);
    },
  );
}
