import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1000),
        side: const BorderSide(color: Colors.black, width: 2),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.asset(
        "images/profile.jpg",
        width: SizeConfig.imageSizeMultiplier * 30,
        height: SizeConfig.imageSizeMultiplier * 30,
        fit: BoxFit.cover,
      ),
    );
  }
}
