import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../shared/responsive.dart';
import '../shared/user_text.dart';
import 'theme_provider.dart';

class ChangeThemeDialog extends ConsumerWidget {
  const ChangeThemeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themesProvider.notifier);

    return SizedBox(
      width: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              UserText.selectTheme,
              style: context.theme().textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Divider(),
            RadioListTile<int>(
              title: const Text(UserText.light),
              value: themeNotifier.lightModeInt,
              groupValue: themeNotifier.themeModeInt,
              onChanged: (i) => themeNotifier.changeThemeMode(i!),
            ),
            RadioListTile<int>(
              title: const Text(UserText.dark),
              value: themeNotifier.darkModeInt,
              groupValue: themeNotifier.themeModeInt,
              onChanged: (i) => themeNotifier.changeThemeMode(i!),
            ),
            RadioListTile<int>(
              title: const Text(UserText.system),
              value: themeNotifier.systemModeInt,
              groupValue: themeNotifier.themeModeInt,
              onChanged: (i) => themeNotifier.changeThemeMode(i!),
            ),
            const Divider(),
            SwitchListTile(
              title: Text(_getSwitchText(context)),
              value: themeNotifier.currentBlackAndWhiteValue,
              onChanged: (value) {
                if (value) {
                  themeNotifier.makeBackgroundWhiteOrBlack();
                } else {
                  themeNotifier.doNotmakeBackgroundWhiteOrBlack();
                }
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text(UserText.cancel),
                    onPressed: () {
                      themeNotifier.cancelThemeChange();
                      context.pop();
                    },
                  ),
                  TextButton(
                    child: const Text(UserText.save),
                    onPressed: () async {
                      final router = GoRouter.of(context);
                      await themeNotifier.saveTheme();
                      router.pop();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getSwitchText(BuildContext context) {
    if (context.theme().brightness == Brightness.light) {
      return UserText.makeThemeBackgroundWhite;
    } else {
      return UserText.makeThemeBackgroundBlack;
    }
  }
}

Future<IconData?> showIconPicker(
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
}

class DialogStuff extends StatelessWidget {
  const DialogStuff({
    super.key,
    required this.allIcons,
    required this.selectedIcon,
    required this.onChanged,
  });

  final List<IconData> allIcons;
  final IconData? selectedIcon;
  final void Function(IconData i) onChanged;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pick an Icon'),
      content: Container(
        width: 320,
        height: 400,
        alignment: Alignment.center,
        // This grid view displays all selectable icons
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 60,
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: allIcons.length,
            itemBuilder: (_, index) => Container(
                  key: ValueKey(allIcons[index].codePoint),
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: IconButton(
                      // give the selected icon a different color
                      color: selectedIcon == allIcons[index]
                          ? Colors.blue
                          : Colors.green,
                      iconSize: 30,
                      icon: Icon(
                        allIcons[index],
                      ),
                      onPressed: () {
                        onChanged(allIcons[index]);
                        context.pop();
                      },
                    ),
                  ),
                )),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Close'))
      ],
    );
  }
}
