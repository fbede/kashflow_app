import 'package:flutter/material.dart';
import 'package:kashflow/shared/components/other_widgets.dart';
import 'package:kashflow/shared/core/log_handler.dart';
import 'package:kashflow/shared/elements/user_text.dart';

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
      Logger.instance.handle(exception, stacktrace);
    }

    await showDialog<Never>(
      context: context,
      builder: (context) => ErrorDialog(message: errorMessage),
    );
  }

  String get _firstTerm => exception.toString().split(' ')[0];

  bool get _isSQLiteException {
    if (_firstTerm.contains('SqliteException')) {
      return true;
    } else {
      return false;
    }
  }

  // ignore: non_constant_identifier_names
  int get _SQLiteErrorCode {
    if (_isSQLiteException) {
      return int.parse(_firstTerm.replaceAll(RegExp('[^0-9]'), ''));
    } else {
      return 2023;
    }
  }
}

const _uniqueConstraintFailed = 2067;
const _defaultErrorMessage = 'Unknown Error';
