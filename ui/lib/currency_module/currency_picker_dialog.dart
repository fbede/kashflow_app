import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow_core/kashflow_core.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../components/other_widgets.dart';
import '../core/responsive.dart';
import '../ui_elements/user_text.dart';
import 'currency_models.dart';
import 'currency_provider.dart';

Future<CurrencyTableData?> showCurrencyPicker(BuildContext context) async {
  CurrencyTableData? data;

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

  final ValueChanged<CurrencyTableData> onTap;

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
                UserText.selectCurrency,
                style: context.textTheme.headlineSmall,
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
                          .watch(otherCurrencyProviderFamily.call(searchTerm)),
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
          child: Text(titleString, style: context.textTheme.titleSmall),
        ),
      );
}

class _CurrencyList extends StatelessWidget {
  const _CurrencyList({required this.onTap, required this.dataProvider});

  final ValueChanged<CurrencyTableData> onTap;
  final AsyncValue<List<CurrencyTableData>> dataProvider;

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
            return data[index].buildCardTile(onTap: onTap);
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
                  hintText: UserText.search,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Visibility(
              visible: false,
              child: SizedBox.square(
                dimension: 48,
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: () {},
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Icon(PhosphorIcons.regular.plus),
                ),
              ),
            )
          ],
        ),
      );
}
