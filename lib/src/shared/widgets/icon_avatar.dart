import 'package:flutter/material.dart';

import '../../core/db/db.dart';

class IconAvatar extends StatelessWidget {
  const IconAvatar({required this.data, super.key});

  final IconTableData data;

  @override
  Widget build(BuildContext context) {
    final iconData = IconData(
      data.codePoint,
      fontFamily: data.fontFamily,
      fontFamilyFallback: data.fontFamilyFallback,
      fontPackage: data.fontPackage,
      matchTextDirection: data.matchTextDirection,
    );

    return CircleAvatar(
      backgroundColor:
          data.backgroundColor == null ? null : Color(data.backgroundColor!),
      foregroundColor: data.iconColor == null ? null : Color(data.iconColor!),
      child: Icon(iconData),
    );
  }
}
