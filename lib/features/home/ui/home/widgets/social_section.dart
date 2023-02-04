import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';
import 'package:flutter_portfolio/core/utils/assets_path_generator.dart';
import 'package:flutter_portfolio/core/utils/url_launcher.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width * 100,
      height: 250,
      child: const Socials(),
    );
  }
}

class Socials extends StatelessWidget {
  const Socials({super.key});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Constants.mobileTitleSize,
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
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                launchTheUrl(Constants.githubUrl);
              },
              child: Image.asset(
                assetsPathGenerator("images/github_logo.png"),
                height: iconSize,
                width: iconSize,
              ),
            ),
            SizedBox(
              width: sizedBoxValue,
            ),
            InkWell(
              onTap: () {
                launchTheUrl(Constants.stackUrl);
              },
              child: Image.asset(
                assetsPathGenerator("images/stack_logo.png"),
                height: iconSize,
                width: iconSize,
              ),
            ),
            SizedBox(
              width: sizedBoxValue,
            ),
            InkWell(
              onTap: () {
                launchTheUrl(Constants.linkedinUrl);
              },
              child: Image.asset(
                assetsPathGenerator("images/linkedin_logo.png"),
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
