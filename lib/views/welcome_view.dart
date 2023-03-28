part of 'views.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          UserText.Welcome,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w100,
          ),
        ),
        SizedBox(height: 8),
        FilledButton(
          onPressed: () => context.pushNamed(AppRoute.CHOOSE_DEFAULT_CURRENCY),
          child: Text(UserText.Choose_Default_Currency),
        ),
      ],
    )));
  }
}
