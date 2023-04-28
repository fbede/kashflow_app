part of 'elements.dart';

//TODO: Move borders to this file
class DecorationElements {
  static BorderSide getRegularBorderSide(BuildContext context) {
    return BorderSide(
      color: Theme.of(context).colorScheme.outline,
      width: Theme.of(context).dividerTheme.thickness ?? 1,
    );
  }

  static BorderSide getFocusedBorderSide(BuildContext context) {
    return BorderSide(
      color: Theme.of(context).colorScheme.primary,
      width: 2,
    );
  }

  static ButtonStyle getErrorTextButtonStyle(BuildContext context) {
    return TextButton.styleFrom(
      alignment: Alignment.center,
      textStyle: TextStyle(
        color: Theme.of(context).colorScheme.error,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
