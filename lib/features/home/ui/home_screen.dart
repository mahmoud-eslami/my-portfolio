import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';
import 'package:flutter_portfolio/core/utils/size_checker.dart';
import 'package:flutter_portfolio/features/home/ui/widgets/name_logo.dart';
import 'package:flutter_portfolio/features/home/ui/widgets/skills_sections.dart';
import 'package:flutter_portfolio/features/home/ui/widgets/social_section.dart';

import 'widgets/buttons_section.dart';
import 'widgets/footer_section.dart';
import 'widgets/profile_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/title_section.dart';
import 'widgets/what_do_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizeChecker.isMobile(context)
            ? const MobileSize()
            : const DesktopSize());
  }
}

class DesktopSize extends StatelessWidget {
  const DesktopSize({super.key});

  @override
  Widget build(BuildContext context) {
    const spacer = 40.0;
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Constants.creamColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .2),
              child: Column(
                children: const [
                  SizedBox(
                    height: spacer,
                  ),
                  Center(
                    child: NameLogo(),
                  ),
                  SizedBox(
                    height: spacer,
                  ),
                  ProfileSection(),
                  SizedBox(
                    height: spacer,
                  ),
                  TitleSection(),
                  SizedBox(
                    height: spacer,
                  ),
                  ButtonsSection(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          const SocialSection(),
          const WhatIDoSection(),
          const SizedBox(
            height: spacer + 10,
          ),
          const ProjectsSection(),
          const SkillsSection(),
          const FooterSection(),
          const CopyRightSection(),
        ],
      ),
    );
  }
}

class MobileSize extends StatelessWidget {
  const MobileSize({super.key});

  @override
  Widget build(BuildContext context) {
    const spacer = 40.0;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Constants.creamColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.mobileHorizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: spacer,
                  ),
                  Center(
                    child: NameLogo(),
                  ),
                  SizedBox(
                    height: spacer,
                  ),
                  ProfileSection(),
                  SizedBox(
                    height: spacer,
                  ),
                  TitleSection(),
                  SizedBox(
                    height: spacer + 10,
                  ),
                  ButtonsSection(),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
          const SocialSection(),
          const WhatIDoSection(),
          const SizedBox(
            height: spacer + 10,
          ),
          const ProjectsSection(),
          const SkillsSection(),
          const FooterSection(),
          const CopyRightSection(),
        ],
      ),
    );
  }
}
