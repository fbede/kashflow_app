import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../components/color_picker.dart';
import '../../../../core/core.dart';
import '../../../extensions/build_context_extensions.dart';
import '../icons.dart';

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
    final userText = context.t.shared.icon_module.icon_selector;

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
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: AssetIcon(
                  selectedIcon,
                  color: iconColor ?? defualtIconColor,
                ),
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
                label: Text(userText.change_icon_color),
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
                label: Text(userText.change_background_color),
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
                label: Text(userText.reset_colors),
                onPressed: _resetColors,
                icon: Assets.lucide.circleAlert.svg(
                  theme: SvgTheme(currentColor: context.colorScheme.error),
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
  IconSelectorController(
    this.iconData, {
    this.iconColor,
    this.backgroundColor,
  });

  AssetIconTableData iconData;
  Color? iconColor;
  Color? backgroundColor;

  void updateSelectedIcon(AssetIconTableData iconData) {
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
}
