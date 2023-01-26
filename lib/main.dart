import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/constants/constants.dart';

import 'features/home/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return LayoutBuilder(builder: (context, constraints) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mahmoud.dev',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "opensans",
            scaffoldBackgroundColor: Constants.creamColor,
          ),
          home: const SelectionArea(
            child: HomeScreen(),
          ),
        );
      });
    });
  }
}
