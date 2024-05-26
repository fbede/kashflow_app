import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/db/db.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../shared.dart';

class AssetIcon extends StatelessWidget {
  final AssetIconTableData data;
  final Color? color;

  const AssetIcon(this.data, {super.key, this.color});

  @override
  Widget build(BuildContext context) =>
      SvgGenImage('assets/lucide/${data.name}.svg').svg(
        theme: SvgTheme(
          currentColor: color ?? context.colorScheme.onBackground,
        ),
      );
}
