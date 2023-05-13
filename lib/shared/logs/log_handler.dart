import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class LogHandler implements TalkerObserver {
  @override
  void Function(TalkerError err) get onError => _handleError;

  @override
  void Function(TalkerException err) get onException => _handleException;

  @override
  void Function(TalkerDataInterface log) get onLog => _handleLog;

  Future<void> _handleError(TalkerError err) async {
    await Sentry.captureException(err.exception, stackTrace: err.stackTrace);
  }

  Future<void> _handleException(TalkerException err) async {
    await Sentry.captureException(err.exception, stackTrace: err.stackTrace);
  }

  void _handleLog(TalkerDataInterface log) {}
}

extension AppLogger on Talker {
  static Talker start() => TalkerFlutter.init(observers: [LogHandler()]);
}
