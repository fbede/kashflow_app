import 'package:flutter_test/flutter_test.dart';
import 'package:kashflow/shared/logs/log_handler.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  test(
    'Tests that the observer functions are called when there is an entry',
    () async {
      const message = 'This is a test for sentry';
      final logger = LogHandler();
      bool throwsException = false;

      try {
        await logger.onError(TalkerError(Error(), message: message));

        await logger
            .onException(TalkerException(Exception(), message: message));

        await logger.onLog(TalkerLog(message));
      } on Exception catch (_) {
        throwsException = true;
      }

      expect(throwsException, false);
    },
  );
}
