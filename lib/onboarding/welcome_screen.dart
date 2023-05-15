import 'package:flutter/material.dart';
import 'package:kashflow/gen/assets.gen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: PageView(
                  controller: _controller,
                  children: [
                    Assets.svg.dailyTransactions.svg(),
                    Assets.svg.incomeExpense.svg(),
                    Assets.svg.assetsAndLiabilities.svg()
                  ],
                ),
              ),
            ),
            Container(height: 128, color: Colors.red)
          ],
        ),
      );
}
