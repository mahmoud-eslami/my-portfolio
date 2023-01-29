import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';
import 'package:flutter_portfolio/core/global_widgets/animation_builder.dart';
import 'package:flutter_portfolio/core/utils/assets_path_generator.dart';

import '../../../../core/utils/size_checker.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = SizeChecker.isMobile(context);

    var style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: isMobile
          ? Constants.mobileDescriptionSize
          : Constants.desktopDescriptionSize,
    );
    var size = MediaQuery.of(context).size;

    return AnimationBuilder(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.end,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Text(
            "A highly skilled Flutter  ",
            style: style,
            textAlign: TextAlign.center,
          ),
          Image.asset(
            assetsPathGenerator("images/flutter_logo.png"),
            width: isMobile ? size.width * .1 : 90,
          ),
          Text(
            "  developer over three years of experience building cross-platform mobile applications.",
            style: style,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
