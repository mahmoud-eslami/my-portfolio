import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
    );
    var size = MediaQuery.of(context).size;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.end,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        Text(
          "A highly skilled Flutter  ",
          style: style,
          textAlign: TextAlign.center,
        ),
        Image.asset(
          "images/flutter_logo.png",
          width: size.width * .1,
        ),
        Text(
          "  developer over three years of experience building cross-platform mobile  ",
          style: style,
          textAlign: TextAlign.center,
        ),
        Image.asset(
          "images/mobile_logo.png",
          width: size.width * .1,
        ),
        Text(
          "  applications.",
          style: style,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
