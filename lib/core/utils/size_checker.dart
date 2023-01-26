import 'package:flutter/material.dart';

class SizeChecker {
  static isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
}
