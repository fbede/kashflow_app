import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../shared.dart';
import 'widgets.dart';

class CustomScrollViewWithFaddingAppBar extends StatelessWidget {
  const CustomScrollViewWithFaddingAppBar({
    required this.scrollController,
    required this.slivers,
    required this.title,
    super.key,
  });

  final ScrollController scrollController;
  final List<Widget> slivers;
  final Widget title;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        controller: scrollController,
        slivers: [
          FaddingAppBar(
            scrollController: scrollController,
            title: DefaultTextStyle(
              style: context.textTheme.titleBold
                  .copyWith(color: context.colorScheme.onSurface),
              child: title,
            ),
            background: DefaultTextStyle(
              style: context.textTheme.displayBold
                  .copyWith(color: context.colorScheme.onSurface),
              textAlign: TextAlign.center,
              child: title,
            ),
          ),
          ...slivers,
        ],
      );
}
