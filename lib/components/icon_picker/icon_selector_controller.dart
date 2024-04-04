part of 'icon_selector.dart';

class IconSelectorController extends ChangeNotifier {
  IconSelectorController({
    required this.iconColor,
    required this.backgroundColor,
    IconData? selectedIconData,
  }) : selectedIconData = selectedIconData ?? getRandomIconData();

  factory IconSelectorController.fromIconData(AppIconData appIconData) =>
      IconSelectorController(
        iconColor: appIconData.iconColor,
        backgroundColor: appIconData.backgroundColor,
        selectedIconData: appIconData.iconData,
      );

  IconData selectedIconData;
  Color? iconColor;
  Color? backgroundColor;

  AppIconData get iconInfo => AppIconData.create(
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
