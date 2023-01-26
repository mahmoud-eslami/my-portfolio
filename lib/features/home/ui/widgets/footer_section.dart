import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/global_widgets/custom_button.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: Constants.creamColor,
    );
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.9],
          colors: [
            Colors.black,
            Color.fromARGB(255, 169, 89, 8),
            Colors.black,
          ],
        ),
      ),
      width: size.width,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Have Projects in Your Mind?Let’s Work Together",
            style: style,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          CustomButton(
            title: "Let’s Talk Together",
            onPressed: () {},
            width: size.width * .6,
            height: 60,
          ),
        ],
      ),
    );
  }
}

class CopyRightSection extends StatelessWidget {
  const CopyRightSection({super.key});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 15,
      color: Constants.creamColor,
    );
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          "© 2023 Mahmoud Eslami | All rights reserved",
          style: style,
        )),
      ),
    );
  }
}
