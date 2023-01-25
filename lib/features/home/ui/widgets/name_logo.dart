import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';

class NameLogo extends StatelessWidget {
  const NameLogo({super.key});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 40,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "<",
            style: style.copyWith(
              color: Constants.orangeColor,
            ),
          ),
          TextSpan(
            text: "/",
            style: style.copyWith(
              color: Colors.blue,
            ),
          ),
          TextSpan(
            text: ">",
            style: style.copyWith(
              color: Constants.orangeColor,
            ),
          ),
          TextSpan(text: " Mahmoud.DEV", style: style),
        ]),
      ),
    );
  }
}
