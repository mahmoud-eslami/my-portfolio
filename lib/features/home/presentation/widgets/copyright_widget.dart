import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/strings.dart';

class CopyRightWidget extends StatelessWidget {
  const CopyRightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            Strings.madeWith,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
              color: AppColors.fontColor,
            ),
          ),
        ),
      ],
    );
  }
}
