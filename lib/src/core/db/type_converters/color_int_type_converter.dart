import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class ColorIntTypeConverter extends TypeConverter<Color?, int?> {
  @override
  Color? fromSql(int? fromDb) => fromDb == null ? null : Color(fromDb);

  @override
  int? toSql(Color? value) => value?.value;
}
