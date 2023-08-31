import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

final logger = _Logger.instance;

extension _Logger on Talker {
  static final Talker instance = TalkerFlutter.init(observer: _LogHandler());
}

class _LogHandler implements TalkerObserver {
  @override
  Future<void> onError(TalkerError err) async =>
      Sentry.captureException(err.exception, stackTrace: err.stackTrace);

  @override
  Future<void> onException(TalkerException err) async =>
      Sentry.captureException(err.exception, stackTrace: err.stackTrace);

  @override
  void onLog(TalkerDataInterface log) {}
}
