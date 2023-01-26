import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';

class NameLogo extends StatelessWidget {
  const NameLogo({super.key});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: Constants.mobileHeadSize,
      fontFamily: "dosis",
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Constants.mobileHorizontalPadding),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "<",
            style: style.copyWith(
              color: Constants.orangeColor,
              fontFamily: "dosis",
            ),
          ),
          TextSpan(
            text: "/",
            style: style.copyWith(
              color: Colors.blue,
              fontFamily: "dosis",
            ),
          ),
          TextSpan(
            text: ">",
            style: style.copyWith(
              color: Constants.orangeColor,
              fontFamily: "dosis",
            ),
          ),
          TextSpan(text: " Mahmoud.DEV", style: style),
        ]),
      ),
    );
  }
}
