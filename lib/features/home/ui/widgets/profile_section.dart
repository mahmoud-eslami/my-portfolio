import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: 20,
          left: 40,
          child: Image.asset(
            "images/hda5.png",
            width: size.width * .15,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: Constants.highElevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Constants.infinitieBorderRadius),
                side: const BorderSide(color: Colors.black, width: 2),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                "images/profile.jpg",
                width: size.width * .3,
                height: size.width * .3,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
