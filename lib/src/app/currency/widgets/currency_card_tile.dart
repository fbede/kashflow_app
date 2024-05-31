import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../shared/extensions/build_context_extensions.dart';

class CurrencyCardTile extends StatelessWidget {
  const CurrencyCardTile({
    required this.item,
    required this.onTap,
    super.key,
  });

  final CurrencyTableData item;

  final void Function(CurrencyTableData c) onTap;

//TODO: Try the filled and outlined variants
  @override
  Widget build(BuildContext context) => Card(
        elevation: 0,
        color: context.colorScheme.surfaceContainer,
        margin: EdgeInsets.zero,
        child: ListTile(
          dense: true,
          leading: Text(item.code),
          title: Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: Text(item.symbol),
          onTap: () => onTap(item),
        ),
      );
}
