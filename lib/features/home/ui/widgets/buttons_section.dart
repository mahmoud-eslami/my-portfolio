import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';

import '../../../../core/global_widgets/custom_button.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
  }
}
