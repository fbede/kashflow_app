import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

extension Logger on Talker {
  static Talker instance = TalkerFlutter.init(observers: [_LogHandler()]);
}

class _LogHandler implements TalkerObserver {
  @override
  dynamic Function(TalkerError err) get onError => _handleError;

  @override
  dynamic Function(TalkerException err) get onException => _handleException;

  @override
  dynamic Function(TalkerDataInterface log) get onLog => _handleLog;

  dynamic _handleError(TalkerError err) async {
    await Sentry.captureException(err.exception, stackTrace: err.stackTrace);
    return err.message;
  }

  dynamic _handleException(TalkerException err) async {
    await Sentry.captureException(err.exception, stackTrace: err.stackTrace);
    return err.message;
  }

  dynamic _handleLog(TalkerDataInterface log) {}
}

//TODO: Add file logger
