import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../shared/shared.dart';
import '../../app.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollViewWithFaddingAppBar(
          scrollController: _scrollController,
          slivers: const [
            ...appearanceSection,
          ],
          title: const _Title(),
        ),
      );
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final text = context.t.more;
    final textTheme = context.textTheme;
    return Text(text, style: textTheme.displayBold);
  }
}
