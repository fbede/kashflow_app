import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../appearance.dart';

const appearanceSection = [_AppearanceTitle(), _AppearanceSection()];

class _AppearanceSection extends StatelessWidget {
  const _AppearanceSection();

  @override
  Widget build(BuildContext context) => SliverList.list(
        children: const [
          ThemeModeListTile(),
        ],
      );
}

class _AppearanceTitle extends StatelessWidget {
  const _AppearanceTitle();

  @override
  Widget build(BuildContext context) {
    final text = context.t.appearance;
    final textTheme = context.textTheme;
    return SliverToBoxAdapter(
      child: Text(text.title, style: textTheme.labelBold),
    );
  }
}
