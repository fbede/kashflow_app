import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kashflow/util/strings.dart';

import '../providers/providers.dart';

class ThemeModeTile extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ThemeModeTileState();
}

class ThemeModeTileState extends ConsumerState<ThemeModeTile> {
  late ThemeMode _themeMode;
  ThemeMode? _selectedThemeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = ref.read(settingsProvider).themeMode;
  }

  @override
  Widget build(BuildContext context) {
    _themeMode =
        ref.watch(settingsProvider.select((settings) => settings.themeMode));

    return ListTile(
      leading: _getWidgetIcon(_themeMode),
      title: Text(SELECT_THEMEMODE),
      subtitle: Text(_getWidgetString(_themeMode)),
      onTap: (() => _selectThemeMode(context)),
    );
  }

  Widget _getWidgetIcon(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return Icon(Icons.computer_rounded);
      case ThemeMode.light:
        return Icon(Icons.light_mode_rounded);
      case ThemeMode.dark:
        return Icon(Icons.dark_mode_rounded);
    }
  }

  String _getWidgetString(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return SYSTEM_THEME_MODE;
      case ThemeMode.light:
        return LIGHT_THEME_MODE;
      case ThemeMode.dark:
        return DARK_THEME_MODE;
    }
  }

  void _selectThemeMode(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text(SELECT_THEMEMODE),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                RadioListTile<ThemeMode>(
                  value: ThemeMode.light,
                  groupValue: _selectedThemeMode,
                  title: Text(LIGHT_THEME_MODE),
                  secondary: Icon(Icons.light_mode_rounded),
                  onChanged: (value) {
                    setState(() {
                      _selectedThemeMode = value;
                    });
                    ref
                        .read(settingsProvider.notifier)
                        .updateThemeMode(themeMode: value);
                  },
                ),
                RadioListTile<ThemeMode>(
                  value: ThemeMode.dark,
                  groupValue: _selectedThemeMode,
                  title: Text(DARK_THEME_MODE),
                  secondary: Icon(Icons.dark_mode_rounded),
                  onChanged: (value) {
                    setState(() {
                      _selectedThemeMode = value;
                    });
                    ref
                        .read(settingsProvider.notifier)
                        .updateThemeMode(themeMode: value);
                  },
                ),
                RadioListTile<ThemeMode>(
                  value: ThemeMode.system,
                  groupValue: _selectedThemeMode,
                  title: Text(SYSTEM_THEME_MODE),
                  secondary: Icon(Icons.computer_rounded),
                  onChanged: (value) {
                    setState(() {
                      _selectedThemeMode = value;
                    });
                    ref
                        .read(settingsProvider.notifier)
                        .updateThemeMode(themeMode: value);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
