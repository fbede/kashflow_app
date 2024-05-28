import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
              style: context.textTheme.titleNormal,
            ),
            const SizedBox(height: 8),
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
                prefixIcon: const Icon(LucideIcons.search),
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
  Widget build(BuildContext context, WidgetRef ref) => GridView.builder(
        key: ValueKey(searchTerm),
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          const pageSize = PageSize.large;
          final page = index ~/ pageSize + 1;
          final indexInPage = index % pageSize;
          final query = (
            searchTerm: searchTerm,
            page: page,
            pageSize: PageSize.large,
          );

          final response = ref.watch(assetIconProvider(query));

          return response.when(
            loading: () => _ItemWidget(onTap: (v) {}),
            error: (e, s) => const Text('e\ns'),
            data: (data) {
              if (indexInPage >= data.length) {
                return null;
              }
              return _ItemWidget(item: data[indexInPage], onTap: onTap);
            },
          );
        },
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          maxCrossAxisExtent: 56,
          mainAxisExtent: 56,
        ),
      );
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    required this.onTap,
    this.item,
  });

  final AssetIconTableData? item;
  final ValueChanged<AssetIconTableData> onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: item == null ? () {} : () => onTap(item!),
        child: Card(
          shadowColor: Colors.transparent,
          child: GridTile(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: item == null
                  ? const CustomProgressIndicator()
                  : AssetIcon(item!),
            ),
          ),
        ),
      );
}
