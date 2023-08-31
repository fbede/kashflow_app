import 'package:flutter/material.dart';
import 'package:kashflow_core/kashflow_core.dart';

import '../components/other_widgets.dart';
import '../ui_elements/user_text.dart';

class ExceptionHandler {
  final BuildContext context;
  final Exception exception;
  final StackTrace stacktrace;

  ExceptionHandler({
    required this.context,
    required this.exception,
    required this.stacktrace,
  });

  Future<void> handleSQLiteException() async {
    String errorMessage = _defaultErrorMessage;

    if (_SQLiteErrorCode == _uniqueConstraintFailed) {
      errorMessage = UserText.accountExistErrorMsg;
    } else {
      logger.handle(exception, stacktrace);
    }

    await showDialog<Never>(
      context: context,
      builder: (context) => ErrorDialog(message: errorMessage),
    );
  }

  String get _firstTerm => exception.toString().split(' ')[0];

  bool get isSQLiteException {
    if (_firstTerm.contains('SqliteException')) {
      return true;
    } else {
      return false;
    }
  }

  // ignore: non_constant_identifier_names
  int get _SQLiteErrorCode {
    if (isSQLiteException) {
      return int.parse(_firstTerm.replaceAll(RegExp('[^0-9]'), ''));
    } else {
      return 2023;
    }
  }
}

const _uniqueConstraintFailed = 2067;
const _defaultErrorMessage = 'Unknown Error';
