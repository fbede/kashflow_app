import 'package:flutter/widgets.dart';

import '../../../../core/db/db.dart';
import '../../../../core/gen/assets.gen.dart';

class AssetIcon extends StatelessWidget {
  final AssetIconTableData data;

  const AssetIcon( this.data,{ super.key});

  @override
  Widget build(BuildContext context) =>
      SvgGenImage('assets/lucide/${data.name}.svg').svg();
}
