import 'package:flutter/material.dart';

class TThemes {
  static TextStyle largeTitleWithBoldFontStyle(BuildContext context) => Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold,color: Colors.white);
  static TextStyle appBarTextStyling = const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.white);
}