import 'package:flutter/material.dart';

class AppFontStyle {
  const AppFontStyle(this.context);

  final BuildContext context;

  TextStyle? titleSmall(){
    return Theme.of(context).textTheme.titleSmall;
  }

  TextStyle? titleMedium(){
    return Theme.of(context).textTheme.titleMedium;
  }

  TextStyle? bodyMedium(){
    return Theme.of(context).textTheme.bodyMedium;
  }

}

extension ContextLocaleExtension on BuildContext {
  AppFontStyle get appFonts => AppFontStyle(this);
}
