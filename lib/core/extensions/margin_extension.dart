import 'package:flutter/material.dart';

extension MarginExtension on Widget {
  Widget withHorizontalMargin(double margin) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: this,
    );
  }
}
