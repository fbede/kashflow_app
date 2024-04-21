import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kashflow/account_module/home_screen.dart';
import 'package:kashflow/icons_module/icons.dart';
import 'package:kashflow/shared/keys.dart';
import 'package:kashflow/shared/route_names.dart';
import 'package:kashflow/shared/router.dart';
import 'package:kashflow/ui_elements/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async => SharedPreferences.setMockInitialValues({}));

  group(
      '''Checks that the onboarding screen works properly while using the buttons to navigate''',
      () {
    testWidgets('Tests Page One', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: getTestRouter(initalLocation: Routes.onboarding),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('page1')), findsOneWidget);

      expect(
        find.byIcon(RemixIcons.arrow_left_line).hitTestable(),
        findsNothing,
      );

      expect(find.byIcon(RemixIcons.arrow_right_line), findsOneWidget);

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 16);
          } else {
            return false;
          }
        }),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 8);
          } else {
            return false;
          }
        }),
        findsNWidgets(3),
      );
    });

    testWidgets('Tests Page Two', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: getTestRouter(initalLocation: Routes.onboarding),
        ),
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(RemixIcons.arrow_right_line));
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('page2')), findsOneWidget);

      expect(
        find.byIcon(RemixIcons.arrow_left_line).hitTestable(),
        findsOneWidget,
      );

      expect(find.byIcon(RemixIcons.arrow_right_line), findsOneWidget);

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 16);
          } else {
            return false;
          }
        }),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 8);
          } else {
            return false;
          }
        }),
        findsNWidgets(3),
      );
    });

    testWidgets('Tests Page Three', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: getTestRouter(initalLocation: Routes.onboarding),
        ),
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(RemixIcons.arrow_right_line));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(RemixIcons.arrow_right_line));
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('page3')), findsOneWidget);

      expect(
        find.byIcon(RemixIcons.arrow_left_line).hitTestable(),
        findsOneWidget,
      );

      expect(find.byIcon(RemixIcons.arrow_right_line), findsOneWidget);

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 16);
          } else {
            return false;
          }
        }),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 8);
          } else {
            return false;
          }
        }),
        findsNWidgets(3),
      );
    });

    testWidgets('Tests Page Four', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: getTestRouter(initalLocation: Routes.onboarding),
        ),
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(RemixIcons.arrow_right_line));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(RemixIcons.arrow_right_line));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(RemixIcons.arrow_right_line));
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('page4')), findsOneWidget);

      expect(
        find.byIcon(RemixIcons.arrow_left_line).hitTestable(),
        findsOneWidget,
      );

      expect(find.byIcon(RemixIcons.check_line), findsOneWidget);

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 16);
          } else {
            return false;
          }
        }),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 8);
          } else {
            return false;
          }
        }),
        findsNWidgets(3),
      );
    });

    testWidgets('Tests Routing to HomePage is completed correctly',
        (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            theme: lightThemeOld(useDeepBlacks: true),
            routerConfig: getTestRouter(initalLocation: Routes.onboarding),
          ),
        ),
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(RemixIcons.arrow_right_line));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(RemixIcons.arrow_right_line));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(RemixIcons.arrow_right_line));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(RemixIcons.check_line));
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);

      final prefs = await SharedPreferences.getInstance();

      final hasOnboarded = prefs.getBool(PrefKeys.hasOnboarded) ?? false;

      expect(hasOnboarded, true);
    });
  });

  group(
      '''Checks that the onboarding screen works properly while using gestures to navigate''',
      () {
    testWidgets('Tests Swiping to Page Two', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: getTestRouter(initalLocation: Routes.onboarding),
        ),
      );
      await tester.pumpAndSettle();

      await tester.drag(find.byType(PageView), const Offset(-750, 0));
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('page2')), findsOneWidget);

      expect(
        find.byIcon(RemixIcons.arrow_left_line).hitTestable(),
        findsOneWidget,
      );

      expect(find.byIcon(RemixIcons.arrow_right_line), findsOneWidget);

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 16);
          } else {
            return false;
          }
        }),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 8);
          } else {
            return false;
          }
        }),
        findsNWidgets(3),
      );
    });

    testWidgets('Tests Swiping to Page Three', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: getTestRouter(initalLocation: Routes.onboarding),
        ),
      );
      await tester.pumpAndSettle();

      await tester.drag(find.byType(PageView), const Offset(-750, 0));
      await tester.pumpAndSettle();
      await tester.drag(find.byType(PageView), const Offset(-750, 0));
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('page3')), findsOneWidget);

      expect(
        find.byIcon(RemixIcons.arrow_left_line).hitTestable(),
        findsOneWidget,
      );

      expect(find.byIcon(RemixIcons.arrow_right_line), findsOneWidget);

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 16);
          } else {
            return false;
          }
        }),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 8);
          } else {
            return false;
          }
        }),
        findsNWidgets(3),
      );
    });

    testWidgets('Tests Swiping to Page Four', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: getTestRouter(initalLocation: Routes.onboarding),
        ),
      );
      await tester.pumpAndSettle();

      await tester.drag(find.byType(PageView), const Offset(-750, 0));
      await tester.pumpAndSettle();
      await tester.drag(find.byType(PageView), const Offset(-750, 0));
      await tester.pumpAndSettle();
      await tester.drag(find.byType(PageView), const Offset(-750, 0));
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('page4')), findsOneWidget);

      expect(
        find.byIcon(RemixIcons.arrow_left_line).hitTestable(),
        findsOneWidget,
      );

      expect(find.byIcon(RemixIcons.check_line), findsOneWidget);

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 16);
          } else {
            return false;
          }
        }),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is AnimatedContainer) {
            final constraints = widget.constraints!;

            return (constraints.maxHeight == constraints.minHeight) &&
                (constraints.maxWidth == constraints.minWidth) &&
                (constraints.maxHeight == constraints.maxWidth) &&
                (constraints.maxHeight == 8);
          } else {
            return false;
          }
        }),
        findsNWidgets(3),
      );
    });
  });
}
