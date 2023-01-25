import 'package:flutter/material.dart';

import '../../../../core/global_widgets/custom_button.dart';
import '../../../../core/utils/size_config.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          title: "Download CV",
          onPressed: () {},
          width: SizeConfig.widthMultiplier * 50,
          height: 70,
        ),
        CustomButton(
          title: "Hire me!",
          onPressed: () {},
          width: SizeConfig.widthMultiplier * 50,
          height: 70,
        ),
      ],
    );
  }
}
