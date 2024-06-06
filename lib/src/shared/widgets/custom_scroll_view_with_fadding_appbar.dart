import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            FaddingAppBar(
              scrollController: scrollController,
              title: title,
              background: title,
            ),
            ...slivers,
          ],
        ),
      );
}
