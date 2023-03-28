part of 'views.dart';

class EditCurrencyView extends ConsumerStatefulWidget {
  const EditCurrencyView({required this.titleString});

  final String titleString;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditCurrencyViewState();
}

class _EditCurrencyViewState extends ConsumerState<EditCurrencyView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmallCustomAppBar(
        title: Text(widget.titleString),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox.shrink(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 12),
        child: SizedBox.shrink(),
      ),
    );
  }
}
