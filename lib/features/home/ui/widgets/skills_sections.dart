import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/utils/assets_path_generator.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/size_checker.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        color: Constants.creamColor,
        child: _builder(context));
  }

  _builder(BuildContext context) {
    bool isMobile = SizeChecker.isMobile(context);
    var size = MediaQuery.of(context).size;

    if (isMobile) {
      return Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          mainSkills(context),
          const SizedBox(
            height: 30,
          ),
          softwareSkills(context),
          const SizedBox(
            height: 30,
          ),
          designSkills(context),
          const SizedBox(
            height: 30,
          ),
          familierSkills(context),
          const SizedBox(
            height: 30,
          ),
        ],
      );
    }

    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width * .4,
              child: mainSkills(context),
            ),
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              width: size.width * .4,
              child: softwareSkills(context),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width * .4,
              child: designSkills(context),
            ),
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              width: size.width * .4,
              child: familierSkills(context),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  lineSplitter(BuildContext context) {
    bool isMobile = SizeChecker.isMobile(context);
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * (isMobile ? .5 : .2),
      height: 3,
      color: Constants.greenColor,
    );
  }

  mainSkills(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Constants.mobileTitleSize,
      color: Colors.black,
    );

    return Column(
      children: [
        Column(
          children: [
            Text(
              "Main Skills",
              style: style,
            ),
            const SizedBox(
              height: 4,
            ),
            lineSplitter(context),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          direction: Axis.horizontal,
          children:  [
            SkillItem(
              title: "Flutter",
              imagePath: assetsPathGenerator("images/fl_logo.png"),
            ),
            SkillItem(
              title: "Dart",
              imagePath: assetsPathGenerator("images/dart_logo.png"),
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
      ],
    );
  }

  softwareSkills(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Constants.mobileTitleSize,
      color: Colors.black,
    );

    return Column(
      children: [
        Column(
          children: [
            Text(
              "Software Development Skills",
              style: style,
            ),
            const SizedBox(
              height: 4,
            ),
            lineSplitter(context),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          direction: Axis.horizontal,
          children:  [
            SkillItem(
              title: "OOP",
            ),
            SkillItem(
              title: "Git",
              imagePath: assetsPathGenerator("images/git_logo.png"),
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
      ],
    );
  }

  designSkills(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Constants.mobileTitleSize,
      color: Colors.black,
    );

    return Column(
      children: [
        Column(
          children: [
            Text(
              "Design Skills",
              style: style,
            ),
            const SizedBox(
              height: 4,
            ),
            lineSplitter(context),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          direction: Axis.horizontal,
          children:  [
            SkillItem(
              title: "Figma",
              imagePath: assetsPathGenerator("images/figma_logo.png"),
            ),
            SkillItem(
              title: "Adobe XD",
              imagePath: assetsPathGenerator("images/adobe_xd_logo.png"),
            ),
            SkillItem(
              title: "Cupertino",
            ),
            SkillItem(
              title: "Material design",
              imagePath: assetsPathGenerator("images/material_logo.png"),
              isLong: true,
            ),
          ],
        ),
      ],
    );
  }

  familierSkills(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Constants.mobileTitleSize,
      color: Colors.black,
    );
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Column(
          children: [
            Text(
              "Familiar with",
              style: style,
            ),
            const SizedBox(
              height: 4,
            ),
            lineSplitter(context),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          direction: Axis.horizontal,
          children:  [
            SkillItem(
              title: "Python",
              imagePath: assetsPathGenerator("images/python_lang_logo.png"),
            ),
            SkillItem(
              title: "Django",
              imagePath: assetsPathGenerator("images/django_logo.png"),
            ),
            SkillItem(
              title: "Java",
              imagePath: assetsPathGenerator("images/java_lang_logo.png"),
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
      fontSize: Constants.mobileCaptionSize,
      color: (imagePath != null) ? Constants.creamColor : Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.all(Constants.mobilePadding),
      child: Container(
        padding: const EdgeInsets.all(Constants.mobilePadding),
        width: isLong ? 200 : 120,
        decoration: BoxDecoration(
          color: (imagePath != null) ? Colors.black : Colors.transparent,
          border: Border.all(
            color: (imagePath != null) ? Colors.black : Constants.greenColor,
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
