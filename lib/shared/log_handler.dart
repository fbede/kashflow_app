import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

extension Logger on Talker {
  static Talker instance = TalkerFlutter.init(observer: _LogHandler());
}

class _LogHandler implements TalkerObserver {
  @override
  dynamic onError(TalkerError err) async {
    await Sentry.captureException(err.exception, stackTrace: err.stackTrace);
    return err.message;
  }

  @override
  dynamic onException(TalkerException err) async {
    await Sentry.captureException(err.exception, stackTrace: err.stackTrace);
    return err.message;
  }

  @override
  dynamic onLog(TalkerDataInterface log) {}
}
