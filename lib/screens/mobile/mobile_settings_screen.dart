import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:kashflow/components/components.dart';
import 'package:kashflow/router/app_router.dart';
import 'package:kashflow/util/strings.dart';

import '../../providers/providers.dart';

class MobileSettingsScreen extends ConsumerWidget {
  const MobileSettingsScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              automaticallyImplyLeading: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 2.4,
                title: Text(
                  SETTINGS_LABEL,
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
                titlePadding: EdgeInsetsDirectional.only(start: 16, bottom: 18),
              ),
            ),
            SliverMasonryGrid(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 700,
              ),
              delegate: SliverChildListDelegate.fixed([
                _ThemeModeTile(),
                DefaultCurrencyTile(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeModeTile extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ThemeModeTileState();
}

class ThemeModeTileState extends ConsumerState<_ThemeModeTile> {
  late ThemeMode _themeMode;
  ThemeMode? _selectedThemeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = ref.read(settingsProvider).themeMode;
    _selectedThemeMode = _themeMode;
  }

  @override
  Widget build(BuildContext context) {
    _themeMode =
        ref.watch(settingsProvider.select((settings) => settings.themeMode));

    return ListTile(
      leading: _getWidgetIcon(_themeMode),
      title: Text(THEME),
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
            width: 300,
            child: ListView(
              shrinkWrap: true,
              children: [
                RadioListTile<ThemeMode>(
                  contentPadding: EdgeInsets.all(0),
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
                  contentPadding: EdgeInsets.all(0),
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
                  contentPadding: EdgeInsets.all(0),
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
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(DONE_ALL_CAPS_STRING),
            )
          ],
        );
      },
    );
  }
}
