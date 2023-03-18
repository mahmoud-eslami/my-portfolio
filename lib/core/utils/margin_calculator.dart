import 'package:flutter/cupertino.dart';

double marginCalculator(BuildContext context) =>
    MediaQuery.of(context).size.width < 600
        ? 50
        : MediaQuery.of(context).size.width *
            (MediaQuery.of(context).size.width < 1000 ? .2 : .3);

double projectSectionMarginCalculator(BuildContext context) =>
    MediaQuery.of(context).size.width < 600
        ? 40
        : MediaQuery.of(context).size.width *
            (MediaQuery.of(context).size.width < 1000 ? .15 : .25);
