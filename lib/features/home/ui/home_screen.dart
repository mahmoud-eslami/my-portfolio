import 'package:flutter/material.dart';
import 'package:flutter_portfolio/features/home/ui/widgets/name_logo.dart';
import 'package:flutter_portfolio/features/home/ui/widgets/social_section.dart';

import 'widgets/buttons_section.dart';
import 'widgets/profile_section.dart';
import 'widgets/title_section.dart';

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
                  height: spacer,
                ),
                ButtonsSection(),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          const SocialSection(),
        ],
      ),
    );
  }
}
