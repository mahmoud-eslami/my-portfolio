import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';
import 'package:flutter_portfolio/core/utils/assets_path_generator.dart';
import 'package:flutter_portfolio/core/utils/size_checker.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isMobile = SizeChecker.isMobile(context);
    return Stack(
      children: [
        Positioned(
          top: isMobile ? 20 : 0,
          left: size.width * .12,
          child: Image.asset(
            assetsPathGenerator("images/hda5.png"),
            width: size.width * (isMobile ? 0.15 : 0.08),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: Constants.highElevation,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(Constants.infinitieBorderRadius),
                side: const BorderSide(color: Colors.black, width: 2),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                assetsPathGenerator("images/profile.jpg"),
                width: isMobile ? size.width * .3 : size.width * .15,
                height: isMobile ? size.width * .3 : size.width * .15,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
