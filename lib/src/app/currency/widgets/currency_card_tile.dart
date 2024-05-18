import 'package:flutter/material.dart';

class CurrencyCardTile<T> extends StatelessWidget {
  const CurrencyCardTile({
    required this.item,
    required this.onTap,
    required this.code,
    required this.symbol,
    required this.name,
    super.key,
  });

  final T item;
  final String code, symbol, name;
  final void Function(T c) onTap;

//TODO: Try the filled and outlined variants
  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.zero,
        shadowColor: Colors.transparent,
        child: ListTile(
          dense: true,
          leading: Text(code),
          title: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: Text(symbol),
          onTap: () => onTap(item),
        ),
      );
}
