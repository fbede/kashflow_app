import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money2/money2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../shared/custom_loading_indicator.dart';
import '../shared/responsive.dart';
import '../shared/user_text.dart';
import 'currency_provider.dart';

Future<Currency?> showCurrencyPicker(BuildContext context) async {
  Currency? data;

  await showDialog<Widget>(
    context: context,
    builder: (_) => CurrencyPickerDialog(
      onTap: (c) {
        data = c;
        context.pop();
      },
    ),
  );

  return data;
}

class CurrencyPickerDialog extends ConsumerStatefulWidget {
  const CurrencyPickerDialog({required this.onTap, super.key});

  final ValueChanged<Currency> onTap;

  @override
  ConsumerState<CurrencyPickerDialog> createState() =>
      _CurrencyPickerDialogState();
}

class _CurrencyPickerDialogState extends ConsumerState<CurrencyPickerDialog> {
  final _controller = TextEditingController();

  String searchTerm = '';

  @override
  void initState() {
    _controller.addListener(() {
      searchTerm = _controller.text;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                UserText.selectTheme,
                style: context.theme().textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              const Divider(height: 1),
              Expanded(
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    const _Subtitle(titleString: UserText.savedCurriences),
                    _CurrencyList(
                      dataProvider: ref
                          .watch(savedCurrencyProviderFamily.call(searchTerm)),
                      onTap: widget.onTap,
                    ),
                    const _Subtitle(titleString: UserText.otherCurriences),
                    _CurrencyList(
                      dataProvider: ref
                          .watch(assetCurrencyProviderFamily.call(searchTerm)),
                      onTap: widget.onTap,
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              _BottomSearchBar(controller: _controller),
            ],
          ),
        ),
      );
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({required this.titleString});

  final String titleString;
  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(titleString, style: context.theme().textTheme.titleSmall),
        ),
      );
}

class _CurrencyList extends StatelessWidget {
  const _CurrencyList({required this.onTap, required this.dataProvider});

  final ValueChanged<Currency> onTap;
  final AsyncValue<List<Currency>> dataProvider;

  @override
  Widget build(BuildContext context) => dataProvider.when(
        error: (e, s) => SliverToBoxAdapter(
          child: Text(e.toString(), textAlign: TextAlign.center),
        ),
        loading: () =>
            const SliverToBoxAdapter(child: CustomProgressIndicator()),
        data: (data) => SliverGrid.builder(
          itemCount: data.length,
          itemBuilder: (_, index) {
            if (index == data.length) {
              return const CustomProgressIndicator();
            }
            return _ItemWidget(item: data[index], onTap: onTap);
          },
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            maxCrossAxisExtent: 550,
            mainAxisExtent: 48,
          ),
        ),
      );
}

class _BottomSearchBar extends StatelessWidget {
  const _BottomSearchBar({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsetsDirectional.zero,
                  prefixIcon: Icon(PhosphorIcons.regular.magnifyingGlass),
                  hintText: UserText.searchCurrencyNameOrCode,
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox.square(
              dimension: 48,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {},
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Icon(PhosphorIcons.regular.plus),
              ),
            )
          ],
        ),
      );
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({required this.item, required this.onTap});

  final Currency item;
  final void Function(Currency c) onTap;

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
