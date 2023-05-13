import 'package:flutter_test/flutter_test.dart';
import 'package:kashflow/shared/logs/log_handler.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  test(
    'Tests that the observer functions are called',
    () async {
      LogHandler()
          .onError(TalkerError(Error(), message: 'This is a test for sentry'));
    },
  );
}
