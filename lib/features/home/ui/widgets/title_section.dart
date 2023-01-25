import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
    );
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "A highly skilled Flutter  ",
            style: style,
          ),
          WidgetSpan(
              child: Image.asset(
            "images/flutter_logo.png",
            width: SizeConfig.imageSizeMultiplier * 13,
          )),
          TextSpan(
            text:
                "  developer over three years of experience building cross-platform mobile  ",
            style: style,
          ),
          WidgetSpan(
              child: Image.asset(
            "images/mobile_logo.png",
            width: SizeConfig.imageSizeMultiplier * 13,
          )),
          TextSpan(
            text: "  applications.",
            style: style,
          ),
        ],
      ),
    );
  }
}
