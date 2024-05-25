import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../shared.dart';
import 'asset_icon.dart';

Future<AssetIconTableData?> showIconPicker(BuildContext context) async {
  AssetIconTableData? iconData;

  await showDialog<Widget>(
    context: context,
    builder: (_) => IconPickerDialog(
      onTap: (i) {
        iconData = i;
        context.pop();
      },
    ),
  );

  return iconData;
}

class IconPickerDialog extends ConsumerStatefulWidget {
  const IconPickerDialog({required this.onTap, super.key});

  final ValueChanged<AssetIconTableData> onTap;

  @override
  ConsumerState<IconPickerDialog> createState() => _IconPickerDialogState();
}

class _IconPickerDialogState extends ConsumerState<IconPickerDialog> {
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
    final userText = context.t.shared.icon_module.icon_picker;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              userText.select_icon,
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Divider(height: 1),
            Expanded(
              child: _IconGrid(
                onTap: widget.onTap,
                searchTerm: searchTerm,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.text,
              autocorrect: false,
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                contentPadding: EdgeInsetsDirectional.zero,
                prefixIcon: Assets.lucide.search.svg(),
                hintText: userText.search,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _IconGrid extends ConsumerWidget {
  const _IconGrid({
    required this.onTap,
    required this.searchTerm,
  });

  final ValueChanged<AssetIconTableData> onTap;
  final String searchTerm;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(assetIconPresenter.call(searchTerm)).when(
            loading: () => const CustomProgressIndicator(),
            error: (e, s) => const Text('e\ns'),
            data: (data) => GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  _ItemWidget(item: data[index], onTap: onTap),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                maxCrossAxisExtent: 48,
                mainAxisExtent: 40,
              ),
            ),
          );
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    required this.item,
    required this.onTap,
  });

  final AssetIconTableData item;
  final ValueChanged<AssetIconTableData> onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => onTap(item),
        child: Card(
          margin: EdgeInsets.zero,
          shadowColor: Colors.transparent,
          child: GridTile(child: AssetIcon(item)),
        ),
      );
}
