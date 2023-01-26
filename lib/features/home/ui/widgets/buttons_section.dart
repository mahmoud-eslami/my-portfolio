import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';
import 'package:flutter_portfolio/core/utils/url_launcher.dart';

import '../../../../core/global_widgets/custom_button.dart';
import '../../../../core/utils/size_checker.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _builder(context);
  }

  _builder(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isMobile = SizeChecker.isMobile(context);
    if (isMobile) {
      return Column(
        children: [
          CustomButton(
            title: "Download CV",
            onPressed: () {},
            width: size.width * .4,
            height: Constants.mobileBtnHeight,
          ),
          CustomButton(
            title: "Hire me!",
            onPressed: () {},
            width: size.width * .4,
            height: Constants.mobileBtnHeight,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            title: "Download CV",
            onPressed: () {
              launchTheUrl(Constants.resumeUrl);
            },
            width: Constants.desktopButtonWidth,
            height: Constants.desktopButtonHeight,
          ),
          const SizedBox(
            width: 20,
          ),
          CustomButton(
            title: "Hire me !",
            onPressed: () {
              launchTheUrl(Constants.emailUrl);
            },
            width: Constants.desktopButtonWidth,
            height: Constants.desktopButtonHeight,
          ),
        ],
      );
    }
  }
}
