import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:grouped_scroll_view/grouped_scroll_view.dart';
import 'package:money2/money2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../db/currency_dao.dart';
import '../../db/drift_db.dart';
import '../../models/util_models.dart';
import '../../shared/route_names.dart';
import '../../util/hidden_strings.dart';
import '../../util/paths.dart';
import '../../util/responsive.dart';
import '../../util/visible_strings.dart';
import '../elements/elements.dart';

part 'currency_picker_view.dart';
part 'edit_currency_view.dart';
part 'welcome_view.dart';
