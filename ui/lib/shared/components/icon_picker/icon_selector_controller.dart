part of 'icon_selector.dart';

class IconSelectorController extends ChangeNotifier {
  IconSelectorController({
    required this.iconColor,
    required this.backgroundColor,
    IconData? selectedIconData,
  }) : selectedIconData = selectedIconData ?? getRandomIconData();

  factory IconSelectorController.fromIconData(IconInfo iconInfo) =>
      IconSelectorController(
        iconColor: iconInfo.iconColor,
        backgroundColor: iconInfo.backgroundColor,
        selectedIconData: iconInfo.iconData,
      );

  IconData selectedIconData;
  Color iconColor;
  Color backgroundColor;

  IconInfo get iconInfo => IconInfo(
        id: null,
        iconData: selectedIconData,
        iconColor: iconColor,
        backgroundColor: backgroundColor,
      );

  void updateSelectedIcon(IconData iconData) {
    selectedIconData = iconData;
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
}
