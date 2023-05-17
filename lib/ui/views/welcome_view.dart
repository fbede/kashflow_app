part of 'views.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                UserText.Welcome,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: () =>
                    context.pushNamed(Routes.CHOOSE_DEFAULT_CURRENCY),
                child: const Text(UserText.Choose_Default_Currency),
              ),
            ],
          ),
        ),
      );
}
