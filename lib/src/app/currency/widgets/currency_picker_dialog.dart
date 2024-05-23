import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../providers/providers.dart';
import 'currency_card_tile.dart';

Future<CurrencyTableData?> showCurrencyPicker(
  BuildContext context,
  String titleString, {
  bool barrierDismissible = true,
}) async {
  CurrencyTableData? data;

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

  final ValueChanged<CurrencyTableData> onTap;
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
  Widget build(BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                widget.titleString,
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              const Divider(height: 1),
              Expanded(
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    ref.watch(currencyPresenter.call(searchTerm)).when(
                          error: _buildErrorText,
                          loading: _buildLoader,
                          data: (data) => SliverGrid.builder(
                            itemCount: data.length,
                            itemBuilder: (_, index) => CurrencyCardTile(
                              onTap: widget.onTap,
                              item: data[index],
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              maxCrossAxisExtent: 550,
                              mainAxisExtent: 48,
                            ),
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

  SliverToBoxAdapter _buildErrorText(Object e, StackTrace s) =>
      SliverToBoxAdapter(
        child: Text(e.toString(), textAlign: TextAlign.center),
      );

  SliverToBoxAdapter _buildLoader() =>
      const SliverToBoxAdapter(child: CustomProgressIndicator());
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
