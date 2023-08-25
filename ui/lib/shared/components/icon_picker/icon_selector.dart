import 'package:flutter/material.dart';
import 'package:kashflow_core/kashflow_core.dart';

import '../../elements/user_text.dart';
import '../color_picker.dart';
import 'icon_picker.dart';
import 'icon_picker_provider.dart';

part 'icon_selector_controller.dart';

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
    final selectedIcon = controller.selectedIconData;
    final iconColor = controller.iconColor;
    final backgroundColor = controller.backgroundColor;

    return Row(
      children: [
        SizedBox.square(
          dimension: 128,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(selectedIcon, size: 100, color: iconColor),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                label: const Text(UserText.changeIcon),
                onPressed: _updateIcon,
                icon: Icon(selectedIcon, color: iconColor),
              ),
              TextButton.icon(
                onPressed: _onIconColorChanged,
                label: const Text(UserText.changeIconColor),
                icon: Padding(
                  padding: const EdgeInsets.all(4),
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: iconColor, shape: BoxShape.circle),
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
                      color: backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: const SizedBox.square(dimension: 16),
                  ),
                ),
              )
            ],
          ),
        )
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
}
