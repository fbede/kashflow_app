import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'custom_loading_indicator.dart';
import 'icon_picker_provider.dart';
import 'responsive.dart';
import 'user_text.dart';

Future<IconData?> showIconPicker(BuildContext context) async {
  IconData? iconData;

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

  final ValueChanged<IconData> onTap;

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
  Widget build(BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                UserText.selectIcon,
                style: context.theme().textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              const Divider(height: 1),
              Expanded(
                child: _IconGrid(onTap: widget.onTap, searchTerm: searchTerm),
              ),
              const Divider(height: 1),
              _BottomSearchBar(controller: _controller),
            ],
          ),
        ),
      );
}

class _IconGrid extends ConsumerWidget {
  const _IconGrid({required this.onTap, required this.searchTerm});

  final ValueChanged<IconData> onTap;
  final String searchTerm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconsProvider = ref.watch(iconPickerProviderFamily.call(searchTerm));
    return iconsProvider.when(
      error: (e, s) => Text(e.toString(), textAlign: TextAlign.center),
      loading: () => const CustomProgressIndicator(),
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
                decoration: const InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsetsDirectional.zero,
                  prefixIcon: Icon(RemixIcon.search_2_line),
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
                child: const Icon(RemixIcon.add_line),
              ),
            )
          ],
        ),
      );
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({required this.item, required this.onTap});

  final IconData item;
  final ValueChanged<IconData> onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => onTap(item),
        child: Card(
          margin: EdgeInsets.zero,
          shadowColor: Colors.transparent,
          child: GridTile(
            child: Icon(item),
          ),
        ),
      );
}
