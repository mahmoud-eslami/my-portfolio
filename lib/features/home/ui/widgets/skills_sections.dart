import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.black,
    );
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Text(
              "Main Skills",
              style: style,
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: size.width * .5,
              height: 3,
              color: Constants.orangeColor,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          direction: Axis.horizontal,
          children: const [
            SkillItem(
              title: "Flutter",
              imagePath: "images/fl_logo.png",
            ),
            SkillItem(
              title: "Dart",
              imagePath: "images/dart_logo.png",
            ),
            SkillItem(
              title: "BloC Pattern",
            ),
            SkillItem(
              title: "Dio & Http",
            ),
            SkillItem(
              title: "I18n & l10n",
            ),
            SkillItem(
              title: "Animations",
            ),
            SkillItem(
              title: "Asynchronous programming",
              isLong: true,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Text(
              "Software Development Skills",
              style: style,
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: size.width * .5,
              height: 3,
              color: Constants.orangeColor,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          direction: Axis.horizontal,
          children: const [
            SkillItem(
              title: "OOP",
            ),
            SkillItem(
              title: "Git",
              imagePath: "images/git_logo.png",
            ),
            SkillItem(
              title: "CI/CD",
            ),
            SkillItem(
              title: "MVVM",
            ),
            SkillItem(
              title: "Github actions",
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Text(
              "Design Skills",
              style: style,
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: size.width * .5,
              height: 3,
              color: Constants.orangeColor,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          direction: Axis.horizontal,
          children: const [
            SkillItem(
              title: "Figma",
              imagePath: "images/figma_logo.png",
            ),
            SkillItem(
              title: "Adobe XD",
              imagePath: "images/adobe_xd_logo.png",
            ),
            SkillItem(
              title: "Cupertino",
            ),
            SkillItem(
              title: "Material design",
              imagePath: "images/material_logo.png",
              isLong: true,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Text(
              "Familiar with",
              style: style,
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: size.width * .5,
              height: 3,
              color: Constants.orangeColor,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          direction: Axis.horizontal,
          children: const [
            SkillItem(
              title: "Python",
              imagePath: "images/python_lang_logo.png",
            ),
            SkillItem(
              title: "Django",
              imagePath: "images/django_logo.png",
            ),
            SkillItem(
              title: "Java",
              imagePath: "images/java_lang_logo.png",
            ),
          ],
        ),
      ],
    );
  }
}

class SkillItem extends StatelessWidget {
  const SkillItem({
    super.key,
    required this.title,
    this.imagePath,
    this.isLong = false,
  });

  final String title;
  final String? imagePath;
  final bool isLong;
  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: (imagePath != null) ? Constants.creamColor : Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: isLong ? 200 : 120,
        decoration: BoxDecoration(
          color: (imagePath != null) ? Colors.black : Colors.transparent,
          border: Border.all(
            color: (imagePath != null) ? Colors.black : Constants.orangeColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Wrap(children: [
                Image.asset(
                  imagePath!,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
              ]),
            Text(
              title,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
