import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../shared/responsive.dart';
import '../ui_elements/user_text.dart';
import 'theme_provider.dart';

class ChangeThemeDialog extends ConsumerWidget {
  const ChangeThemeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeProvider.notifier);

    return Dialog(
      child: SizedBox(
        width: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                UserText.selectTheme,
                style: context.textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              const Divider(),
              RadioListTile<int>(
                title: const Text(UserText.light),
                value: ThemeMode.light.index,
                groupValue: themeNotifier.themeModeInt,
                onChanged: (i) => themeNotifier.changeThemeMode(i!),
              ),
              RadioListTile<int>(
                title: const Text(UserText.dark),
                value: ThemeMode.dark.index,
                groupValue: themeNotifier.themeModeInt,
                onChanged: (i) => themeNotifier.changeThemeMode(i!),
              ),
              RadioListTile<int>(
                title: const Text(UserText.system),
                value: ThemeMode.system.index,
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
      ),
    );
  }

  String _getSwitchText(BuildContext context) {
    if (context.colorScheme.brightness == Brightness.light) {
      return UserText.makeThemeBackgroundWhite;
    } else {
      return UserText.makeThemeBackgroundBlack;
    }
  }
}
