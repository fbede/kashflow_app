import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../shared/extensions/build_context_extensions.dart';
import '../../../shared/widgets/custom_scroll_view_with_fadding_appbar.dart';
import '../../app.dart' as a;

class SelectThemeModeView extends ConsumerStatefulWidget {
  const SelectThemeModeView({super.key});

  @override
  ConsumerState<SelectThemeModeView> createState() =>
      _SelectThemeModeViewState();
}

class _SelectThemeModeViewState extends ConsumerState<SelectThemeModeView> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final text = context.t.appearance;
    final mode = ref.watch(a.themeModeProvider);
    final notifier = ref.watch(a.themeModeProvider.notifier);

    return Scaffold(
      body: CustomScrollViewWithFaddingAppBar(
        scrollController: scrollController,
        title: Text(
          text.select_theme_mode,
          style: context.textTheme.displayBold,
          textAlign: TextAlign.center,
        ),
        slivers: [
          SliverList.list(
            children: [
              const Divider(),
              RadioListTile<ThemeMode>(
                title: Text(text.light_mode),
                value: ThemeMode.light,
                groupValue: mode,
                selected: mode == ThemeMode.light,
                onChanged: (i) async => notifier.saveThemeMode(i),
              ),
              const Divider(),
              RadioListTile<ThemeMode>(
                title: Text(text.dark_mode),
                value: ThemeMode.dark,
                groupValue: mode,
                selected: mode == ThemeMode.dark,
                onChanged: (i) async => notifier.saveThemeMode(i),
              ),
              const Divider(),
              RadioListTile<ThemeMode>(
                title: Text(text.system),
                value: ThemeMode.system,
                groupValue: mode,
                selected: mode == ThemeMode.system,
                onChanged: (i) async => notifier.saveThemeMode(i),
              ),
              const Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
