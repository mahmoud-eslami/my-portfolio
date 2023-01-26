import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';
import 'package:flutter_portfolio/features/home/ui/widgets/curved_painter.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width * 100,
      height: 500,
      child: CustomPaint(
        painter: CurvedPainter(),
        child: const Socials(),
      ),
    );
  }
}

class Socials extends StatelessWidget {
  const Socials({super.key});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Constants.creamColor,
    );
    var iconSize = 60.0;
    var sizedBoxValue = 30.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "How reach me ?",
          style: style,
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                "images/github_logo.png",
                height: iconSize,
                width: iconSize,
              ),
            ),
            SizedBox(
              width: sizedBoxValue,
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "images/stack_logo.png",
                height: iconSize,
                width: iconSize,
              ),
            ),
            SizedBox(
              width: sizedBoxValue,
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "images/linkedin_logo.png",
                height: iconSize,
                width: iconSize,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
