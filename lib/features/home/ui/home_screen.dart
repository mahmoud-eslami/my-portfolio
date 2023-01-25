import 'package:flutter/material.dart';
import 'package:flutter_portfolio/features/home/ui/widgets/social_section.dart';

import '../../../core/utils/size_config.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  "images/name_logo.png",
                  width: SizeConfig.imageSizeMultiplier * 80,
                )),
                const ProfileSection(),
                const SizedBox(
                  height: 40,
                ),
                const TitleSection(),
                const SizedBox(
                  height: 40,
                ),
                const ButtonsSection(),
                const SizedBox(
                  height: 5,
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
