import 'package:flutter/material.dart';

extension XBuildContext<T> on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  Size get screenSize => MediaQuery.sizeOf(this);
  EdgeInsets get edgeInset => MediaQuery.viewPaddingOf(this);
}
