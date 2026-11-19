import 'package:flutter/widgets.dart';

abstract class LocaleProvider {
  Locale get currentLocale;
}

class FixedLocaleProvider implements LocaleProvider {
  FixedLocaleProvider(this.currentLocale);

  @override
  final Locale currentLocale;
}
