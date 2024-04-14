import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../shared/extensions/build_context_extensions.dart';
import '../ui_elements/user_text.dart';
import 'icon_picker_provider.dart';
import 'icons.dart';

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
                decoration: const InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsetsDirectional.zero,
                  prefixIcon: Icon(RemixIcons.search_2_line),
                  hintText: UserText.search,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
}

class _IconGrid extends ConsumerWidget {
  const _IconGrid({
    required this.onTap,
    required this.searchTerm,
  });

  final ValueChanged<IconData> onTap;
  final String searchTerm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icons = ref.watch(iconPickerProvider.call(searchTerm));
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: icons.length,
      itemBuilder: (context, index) =>
          _ItemWidget(item: icons[index], onTap: onTap),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        maxCrossAxisExtent: 48,
        mainAxisExtent: 40,
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    required this.item,
    required this.onTap,
  });

  final IconData item;
  final ValueChanged<IconData> onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => onTap(item),
        child: Card(
          margin: EdgeInsets.zero,
          shadowColor: Colors.transparent,
          child: GridTile(child: Icon(item)),
        ),
      );
}
