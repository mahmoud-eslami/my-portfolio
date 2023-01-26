import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';
import 'package:flutter_portfolio/core/global_widgets/custom_button.dart';
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
    return const Scaffold(body: MobileSize());
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
          const SocialSection(),
          const WhatIDoSection(),
          const SizedBox(
            height: spacer + 10,
          ),
          const ProjectsSection(),
          const SkillsSection(),
          const SizedBox(
            height: spacer,
          ),
          const FooterSection(),
          const CopyRightSection(),
        ],
      ),
    );
  }
}
