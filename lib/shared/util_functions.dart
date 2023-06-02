/* Future<IconData?> showIconPicker(
    {required BuildContext context, IconData? defalutIcon}) async {
  // these are the selectable icons
  // they will be displayed in a grid view
  // you can specify the icons you need
  final List<IconData> allIcons = [
    Icons.umbrella_sharp,
    Icons.favorite,
    Icons.headphones,
    Icons.home,
    Icons.car_repair,
    Icons.settings,
    Icons.flight,
    Icons.ac_unit,
    Icons.run_circle,
    Icons.book,
    Icons.sports_rugby_rounded,
    Icons.alarm,
    Icons.call,
    Icons.snowing,
    Icons.hearing,
    Icons.music_note,
    Icons.note,
    Icons.edit,
    Icons.sunny,
    Icons.radar,

    // add more icons here if you want
  ];

  // selected icon
  // the selected icon is highlighed
  // so it looks different from the others
  IconData? selectedIcon = defalutIcon;

  await showDialog(
      context: context,
      builder: (_) => DialogStuff(
            allIcons: allIcons,
            selectedIcon: selectedIcon,
            onChanged: (i) {
              selectedIcon = i;
            },
          ));

  return selectedIcon;
} */