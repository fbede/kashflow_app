import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money2/money2.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../providers/providers.dart';
import 'currency_card_tile.dart';

Future<Either<Currency, CurrencyTableData>?> showCurrencyPicker(
  BuildContext context,
  String titleString, {
  bool barrierDismissible = true,
}) async {
  Either<Currency, CurrencyTableData>? data;

  await showDialog<Widget>(
    context: context,
    barrierDismissible: barrierDismissible,
    useRootNavigator: false,
    builder: (_) => CurrencyPickerDialog(
      titleString: titleString,
      onTap: (c) {
        data = c;
        context.pop();
      },
    ),
  );

  return data;
}

class CurrencyPickerDialog extends ConsumerStatefulWidget {
  const CurrencyPickerDialog({
    required this.onTap,
    required this.titleString,
    super.key,
  });

  final ValueChanged<Either<Currency, CurrencyTableData>> onTap;
  final String titleString;

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
  Widget build(BuildContext context) {
    final subtitles = context.t.currency_module.picker.dialog;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              widget.titleString,
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Divider(height: 1),
            Expanded(
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  _Subtitle(titleString: subtitles.saved_currencies),
                  ref.watch(savedCurrenciesPresenter.call(searchTerm)).when(
                        error: _buildErrorText,
                        loading: _buildLoader,
                        data: (data) => _CurrencyList(
                          onTap: widget.onTap,
                          dataProvider: Either.b(data),
                        ),
                      ),
                  _Subtitle(titleString: subtitles.other_currencies),
                  _CurrencyList(
                    onTap: widget.onTap,
                    dataProvider: Either.a(
                      ref.watch(otherCurrenciesPresenter.call(searchTerm)),
                    ),
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

  SliverToBoxAdapter _buildErrorText(Object e, StackTrace s) =>
      SliverToBoxAdapter(
        child: Text(e.toString(), textAlign: TextAlign.center),
      );

  SliverToBoxAdapter _buildLoader() =>
      const SliverToBoxAdapter(child: CustomProgressIndicator());
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

  final ValueChanged<Either<Currency, CurrencyTableData>> onTap;
  final Either<List<Currency>, List<CurrencyTableData>> dataProvider;

  @override
  Widget build(BuildContext context) => dataProvider.when(
        a: (a) => SliverGrid.builder(
          itemCount: a.length,
          itemBuilder: (_, index) => CurrencyCardTile<Currency>(
            onTap: (c) => onTap(Either.a(c)),
            item: a[index],
            code: a[index].isoCode,
            symbol: a[index].symbol,
            name: a[index].name,
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            maxCrossAxisExtent: 550,
            mainAxisExtent: 48,
          ),
        ),
        b: (b) => SliverGrid.builder(
          itemCount: b.length,
          itemBuilder: (_, index) => CurrencyCardTile<CurrencyTableData>(
            onTap: (c) => onTap(Either.b(c)),
            item: b[index],
            code: b[index].code,
            symbol: b[index].symbol,
            name: b[index].name,
          ),
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
              child: SearchTextField(controller: controller),
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
                  //   child: const Icon(PhosphorIconsRegular.plus),
                ),
              ),
            ),
          ],
        ),
      );
}
