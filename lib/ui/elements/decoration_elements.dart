part of 'elements.dart';

class DecorationElements {
  static BorderSide getRegularBorderSide(BuildContext context) {
    return BorderSide(
      color: Theme.of(context).dividerTheme.color!,
      width: Theme.of(context).dividerTheme.thickness!,
    );
  }
}
