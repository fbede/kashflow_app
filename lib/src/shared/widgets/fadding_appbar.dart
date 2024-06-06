import 'package:flutter/material.dart';

import '../shared.dart';

class FaddingAppBar extends StatelessWidget {
  const FaddingAppBar({
    required this.scrollController,
    this.height,
    this.bottom,
    super.key,
    this.title,
    this.background,
  });

  final PreferredSizeWidget? bottom;
  final Widget? title;
  final Widget? background;
  final double? height;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final bottomHeight = bottom == null ? 0 : 64;
    final appBarHeight = height == null
        ? (context.screenSize.height / 3) + bottomHeight
        : height! + bottomHeight;
    final titleWidget = title == null
        ? null
        : FadeOnScroll(
            scrollController: scrollController,
            fullOpacityOffset: appBarHeight,
            child: Center(child: title),
          );
    final backgroundWidget = background == null
        ? null
        : FlexibleSpaceBar(
            background: FadeOnScroll(
              scrollController: scrollController,
              zeroOpacityOffset: appBarHeight,
              child: Center(child: background),
            ),
          );

    return SliverAppBar(
      centerTitle: true,
      expandedHeight: appBarHeight,
      pinned: true,
      stretch: true,
      scrolledUnderElevation: 0,
      title: titleWidget,
      flexibleSpace: backgroundWidget,
      bottom: bottom,
    );
  }
}
