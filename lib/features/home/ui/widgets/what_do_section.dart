import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/utils/assets_path_generator.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/size_checker.dart';

class WhatIDoSection extends StatelessWidget {
  const WhatIDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Constants.mobileTitleSize,
      color: Colors.black,
    );
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "What i do ?",
                    style: style,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    assetsPathGenerator("images/hda10.png"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              WhatIDoItem(
                iconPath: assetsPathGenerator("images/quality_icon.png"),
                description: Constants.qualityExpDescription,
              ),
              WhatIDoItem(
                iconPath: assetsPathGenerator("images/experience_icon.png"),
                description: Constants.experienceDescription,
              ),
              WhatIDoItem(
                iconPath: assetsPathGenerator("images/agile_icon.png"),
                description: Constants.agileExpDescription,
              ),
              WhatIDoItem(
                iconPath: assetsPathGenerator("images/git_icon.png"),
                description: Constants.openSourceExpDescription,
              ),
              WhatIDoItem(
                iconPath: assetsPathGenerator("images/other_skills_icon.png"),
                description: Constants.otherExpDescription,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WhatIDoItem extends StatelessWidget {
  const WhatIDoItem(
      {super.key, required this.iconPath, required this.description});

  final String description;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return _builder(context);
  }

  _builder(BuildContext context) {
    bool isMobile = SizeChecker.isMobile(context);
    var size = MediaQuery.of(context).size;

    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.mobileHorizontalPadding,
          vertical: Constants.mobileVerticalPadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              iconPath,
              width: size.width * .09,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                description,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Constants.mobileCaptionSize,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      width: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.mobileHorizontalPadding,
          vertical: Constants.mobileVerticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 80,
            ),
            const SizedBox(height: 20),
            Text(
              description,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Constants.desktopCaptionSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
