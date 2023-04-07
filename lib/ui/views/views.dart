import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:kashflow/db/currency_dao.dart';
import 'package:kashflow/db/drift_db.dart';
import 'package:kashflow/models/util_models.dart';
import 'package:kashflow/router/app_router.dart';
import 'package:kashflow/ui/elements/elements.dart';
import 'package:kashflow/util/hidden_strings.dart';
import 'package:kashflow/util/visible_strings.dart';

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:grouped_scroll_view/grouped_scroll_view.dart';
import 'package:kashflow/util/paths.dart';
import 'package:money2/money2.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'welcome_view.dart';
part 'currency_picker_view.dart';
part 'edit_currency_view.dart';
