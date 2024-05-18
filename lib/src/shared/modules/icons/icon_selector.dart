import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../components/color_picker.dart';
import '../../../../shared/app_icon_data.dart';
import '../../../../user_text.dart.old';
import '../../extensions/build_context_extensions.dart';
import 'icons.dart';

class IconSelector extends StatefulWidget {
  const IconSelector({required this.controller, super.key});

  final IconSelectorController controller;

  @override
  State<IconSelector> createState() => _IconSelectorState();
}

class _IconSelectorState extends State<IconSelector> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    final selectedIcon = controller.iconData;
    final iconColor = controller.iconColor;
    final backgroundColor = controller.backgroundColor;
    final defualtIconColor = context.colorScheme.onPrimaryContainer;
    final defaultBackgroundColor = context.colorScheme.primaryContainer;

    return Row(
      children: [
        InkWell(
          onTap: _updateIcon,
          child: SizedBox.square(
            dimension: 128,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundColor ?? defaultBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                selectedIcon,
                size: 100,
                color: iconColor ?? defualtIconColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: _onIconColorChanged,
                label: const Text(UserText.changeIconColor),
                icon: Padding(
                  padding: const EdgeInsets.all(4),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: iconColor ?? defualtIconColor,
                      shape: BoxShape.circle,
                    ),
                    child: const SizedBox.square(dimension: 16),
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: _onBackgroundColorChanged,
                label: const Text(UserText.changeBackgroundColor),
                icon: Padding(
                  padding: const EdgeInsets.all(4),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: backgroundColor ?? defaultBackgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: const SizedBox.square(dimension: 16),
                  ),
                ),
              ),
              TextButton.icon(
                label: const Text(UserText.resetColors),
                onPressed: _resetColors,
                icon: Icon(
                  RemixIcons.error_warning_line,
                  color: context.colorScheme.error,
                ),
                style: TextButton.styleFrom(
                  foregroundColor: context.colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _updateIcon() async {
    final icon = await showIconPicker(context);
    if (icon != null) {
      widget.controller.updateSelectedIcon(icon);
    }
  }

  Future<void> _onIconColorChanged() async {
    final color = await showColorPicker(context, widget.controller.iconColor);
    widget.controller.updateIconColor(color);
  }

  Future<void> _onBackgroundColorChanged() async {
    final color =
        await showColorPicker(context, widget.controller.backgroundColor);
    widget.controller.updateBackgroundColor(color);
  }

  void _resetColors() => widget.controller.resetColors();
}

class IconSelectorController extends ChangeNotifier {
  IconSelectorController({
    this.iconColor,
    this.backgroundColor,
    IconData? selectedIconData,
  }) : iconData = selectedIconData ?? _getRandomIconData();

  factory IconSelectorController.fromIconData(AppIconData appIconData) =>
      IconSelectorController(
        iconColor: appIconData.iconColor,
        backgroundColor: appIconData.backgroundColor,
        selectedIconData: appIconData.iconData,
      );

  IconData iconData;
  Color? iconColor;
  Color? backgroundColor;

  void updateSelectedIcon(IconData iconData) {
    this.iconData = iconData;
    notifyListeners();
  }

  void updateIconColor(Color color) {
    iconColor = color;
    notifyListeners();
  }

  void updateBackgroundColor(Color color) {
    backgroundColor = color;
    notifyListeners();
  }

  void resetColors() {
    iconColor = null;
    backgroundColor = null;
    notifyListeners();
  }

  static IconData _getRandomIconData() {
    final icons = remixIconsMap.values.toList();
    final index = Random().nextInt(icons.length);
    return icons[index];
  }
}
