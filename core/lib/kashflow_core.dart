///This library contains the business logic of the kashflow app. It was done in
///this way to enhance modularity and separate the business logic from the ui.
library kashflow_core;

export 'package:money2/money2.dart';
export 'package:package_info_plus/package_info_plus.dart';
export 'package:sentry_flutter/sentry_flutter.dart'
    show SentryFlutter, SentryScreenshotWidget;
export 'package:talker_flutter/talker_flutter.dart' show TalkerRouteObserver;
export 'package:uuid/uuid.dart';

export 'src/account_module/account_dao.dart';
export 'src/account_module/account_models.dart';
export 'src/currency_module/currency_dao.dart';
export 'src/currency_module/currency_extensions.dart';
export 'src/db/local_db.dart' show CurrencyTableData, LocalDB;
export 'src/logger/log_handler.dart';
export 'src/models/shared_models.dart';
