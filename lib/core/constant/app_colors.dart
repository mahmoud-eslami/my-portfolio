import 'dart:ui';

import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_portfolio/core/extensions/string_extensions.dart';

@immutable
class AppColors {
  static final scaffoldBackground = '#EEF2FF'.htmlColorToColor();
  static final fontColor = '#000000'.htmlColorToColor();
  static final linkFontColor = '#10388e'.htmlColorToColor();
  static const testColor = Color.fromRGBO(244, 244, 246, 1.0);

  const AppColors._();
}
