part of 'elements.dart';

class _CustomBackButton extends StatelessWidget {
  const _CustomBackButton({bool? showButton}) : _showButton = showButton;

  final bool? _showButton;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: getVisibility(context),
      child: GestureDetector(
        onTap: () => context.pop(),
        child: Icon(Remix.arrow_left_line),
      ),
    );
  }

  bool getVisibility(BuildContext context) {
    if (context.canPop()) return false;
    if (_showButton == true) return true;
    if (_showButton == false) return false;
    if (context.isPhone()) return true;
    return false;
  }
}

class SmallCustomAppBar extends AppBar {
  final bool? showButton;
  SmallCustomAppBar({
    super.key,
    this.showButton,
    super.automaticallyImplyLeading,
    super.title,
    super.actions,
    super.flexibleSpace,
    super.bottom,
    super.elevation,
    super.scrolledUnderElevation = 0,
    super.notificationPredicate,
    super.shadowColor,
    super.surfaceTintColor,
    super.shape,
    super.backgroundColor,
    super.foregroundColor,
    super.brightness,
    super.iconTheme,
    super.actionsIconTheme,
    super.textTheme,
    super.primary,
    super.centerTitle,
    super.excludeHeaderSemantics,
    super.titleSpacing,
    super.toolbarOpacity = 1.0,
    super.bottomOpacity = 1.0,
    super.toolbarHeight,
    super.leadingWidth,
    super.backwardsCompatibility,
    super.toolbarTextStyle,
    super.titleTextStyle,
    super.systemOverlayStyle,
  }) : super(leading: _CustomBackButton(showButton: showButton));
}

class RoundedSearchBar extends StatelessWidget {
  const RoundedSearchBar({
    super.key,
    this.onChanged,
    this.hintText,
  });

  final ValueChanged<String>? onChanged;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(
      color: Theme.of(context).dividerTheme.color!,
      width: Theme.of(context).dividerTheme.thickness!,
    );
    final searchOutlineInputBorder = OutlineInputBorder(
      borderSide: borderSide,
      borderRadius: BorderRadius.circular(30),
    );

    return TextField(
      keyboardType: TextInputType.text,
      autocorrect: false,
      onChanged: (v) => onChanged,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsetsDirectional.zero,
        prefixIcon: const Icon(Remix.search_line),
        hintText: hintText,
        border: searchOutlineInputBorder,
        enabledBorder: searchOutlineInputBorder,
      ),
    );
  }
}

class CustomProgressIndicator extends StatefulWidget {
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
      duration: Duration(milliseconds: 500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Icon(
          Remix.refresh_line,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
