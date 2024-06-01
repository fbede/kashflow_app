import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../../../shared.dart';

class IconAvatar extends StatelessWidget {
  const IconAvatar({required this.data, super.key});

  final IconAvatarData data;

  @override
  Widget build(BuildContext context) => CircleAvatar(
        backgroundColor: data.backgroundColor,
        foregroundColor: data.iconColor,
        child: SvgGenImage('assets/lucide/${data.iconData.name}.svg').svg(
          theme: SvgTheme(
            currentColor: data.iconColor ?? context.colorScheme.onSurface,
          ),
        ),
      );
}

class IconAvatarData {
  final AssetIconTableData iconData;
  final Color? iconColor;
  final Color? backgroundColor;

  IconAvatarData(
      {required this.iconData, this.iconColor, this.backgroundColor});
}
