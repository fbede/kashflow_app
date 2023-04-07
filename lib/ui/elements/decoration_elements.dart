part of 'elements.dart';

//TODO: Move borders to this file
class DecorationElements {
  static BorderSide getRegularBorderSide(BuildContext context) {
    return BorderSide(
      color: Theme.of(context).colorScheme.outline,
      width: Theme.of(context).dividerTheme.thickness!,
    );
  }

  static BorderSide getFocusedBorderSide(BuildContext context) {
    return BorderSide(
      color: Theme.of(context).colorScheme.onBackground,
      width: 2,
    );
  }
}
