import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class TechnologiesBuilder extends StatelessWidget {
  const TechnologiesBuilder({super.key, required this.techs});

  final List<String> techs;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Constants.defaultPadding * 5),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: techs.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: Constants.defaultPadding),
          child: Text(
            "✅ " + techs[index],
            style: style.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
