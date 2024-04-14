import 'package:flutter/material.dart';

import 'currency.dart';

class CurrencyCardTile extends StatelessWidget {
  const CurrencyCardTile({required this.item, required this.onTap, super.key});

  final AppCurrency item;
  final void Function(AppCurrency c) onTap;

  //TODO: Add Option to Create Edit Currency on Long Tap

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.zero,
        shadowColor: Colors.transparent,
        child: ListTile(
          dense: true,
          leading: Text(item.code),
          title: Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(item.symbol),
          onTap: () => onTap(item),
        ),
      );
}
