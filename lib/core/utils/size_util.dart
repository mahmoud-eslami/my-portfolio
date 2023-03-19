import 'package:flutter/material.dart';

isMobile(BuildContext context) {
  return MediaQuery.of(context).size.width < 600;
}

isTablet(BuildContext context) {
  return MediaQuery.of(context).size.width < 1000 &&
      MediaQuery.of(context).size.width > 600;
}

isDesktop(BuildContext context) {
  return MediaQuery.of(context).size.width > 1000;
}

getComponentFixedWidth(BuildContext context) {
  if (isDesktop(context)) {
    return 500;
  } else if (isTablet(context)) {
    return 400;
  }
  return MediaQuery.of(context).size.width * .8;
}

getProjectsSectionFixedWidth(BuildContext context) {
  if (isDesktop(context)) {
    return 800;
  } else if (isTablet(context)) {
    return 600;
  }
  return MediaQuery.of(context).size.width * .8;
}

double projectSectionMarginCalculator(BuildContext context) => isMobile(context)
    ? 40
    : isTablet(context)
        ? 2
        : 250;
