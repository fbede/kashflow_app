import 'dart:convert';

import 'package:drift/drift.dart';

class StringListTypeConverter extends TypeConverter<List<String>?, String?> {
  @override
  List<String>? fromSql(String? fromDb) => fromDb == null
      ? null
      : List<String>.from(json.decode(fromDb) as Iterable);

  @override
  String toSql(List<String>? value) => json.encode(value);
}
