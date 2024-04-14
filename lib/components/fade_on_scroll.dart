import 'package:flutter/material.dart';

class FadeOnScroll extends StatefulWidget {
  final ScrollController scrollController;
  final double zeroOpacityOffset;
  final double fullOpacityOffset;
  final Widget child;

  const FadeOnScroll({
    required this.scrollController,
    required this.child,
    super.key,
    this.zeroOpacityOffset = 0,
    this.fullOpacityOffset = 0,
  });

  @override
  FadeOnScrollState createState() => FadeOnScrollState();
}

class FadeOnScrollState extends State<FadeOnScroll> {
  double _offset = 0;

  @override
  void initState() {
    super.initState();
    _offset = widget.scrollController.offset;
    widget.scrollController.addListener(_setOffset);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_setOffset);
    super.dispose();
  }

  void _setOffset() {
    setState(() {
      _offset = widget.scrollController.offset;
    });
  }

  double _calculateOpacity() {
    if (widget.fullOpacityOffset == widget.zeroOpacityOffset) {
      return 1;
    } else if (widget.fullOpacityOffset > widget.zeroOpacityOffset) {
      // fading in
      if (_offset <= widget.zeroOpacityOffset) {
        return 0;
      }
      if (_offset >= widget.fullOpacityOffset) {
        return 1;
      } else {
        return (_offset - widget.zeroOpacityOffset) /
            (widget.fullOpacityOffset - widget.zeroOpacityOffset);
      }
    } else {
      // fading out
      if (_offset <= widget.fullOpacityOffset) {
        return 1;
      }
      if (_offset >= widget.zeroOpacityOffset) {
        return 0;
      } else {
        return 1 -
            (_offset - widget.fullOpacityOffset) /
                (widget.zeroOpacityOffset - widget.fullOpacityOffset);
      }
    }
  }

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: _calculateOpacity(),
        child: widget.child,
      );
}
