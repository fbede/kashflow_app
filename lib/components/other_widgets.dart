import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../shared/extensions/build_context_extensions.dart';
import '../ui_elements/user_text.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({super.key});

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox.square(
        dimension: 24,
        child: RotationTransition(
          turns: _controller,
          child: Assets.svg.spinner.svg(
            theme: SvgTheme(
              currentColor: context.colorScheme.onBackground,
            ),
          ),
        ),
      );
}

class NothingFoundWidget extends StatelessWidget {
  const NothingFoundWidget({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Expanded(flex: 3, child: Assets.svg.nothing.svg()),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  text ?? UserText.nothingFound,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
}

class UnderConstructionWidget extends StatelessWidget {
  const UnderConstructionWidget({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Expanded(flex: 5, child: Assets.svg.comingSoon.svg()),
              const SizedBox(height: 16),
              Text(
                text ?? UserText.underConstruction,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
            ],
          ),
        ),
      );
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    required this.message,
    super.key,
    this.titleText,
  });

  final String? titleText;
  final String message;

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: context.colorScheme.errorContainer,
        //   icon: const Icon(R),
        iconColor: context.colorScheme.error,
        title: titleText != null ? Text(titleText!) : null,
        content: ConstrainedBox(
          constraints: BoxConstraints.loose(const Size(400, 400)),
          child: SingleChildScrollView(child: Text(message)),
        ),
        actions: [
          TextButton(
            onPressed: context.pop,
            style: TextButton.styleFrom(
              foregroundColor: context.colorScheme.error,
            ),
            child: const Text(UserText.dismiss),
          )
        ],
      );
}
