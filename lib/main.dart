import 'package:flutter/material.dart';
import 'package:flutter_portfolio/di.dart';

import 'features/home/ui/home_screen.dart';

void main() async {
  await DependencyInjection.initializer();
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
          title: 'Mahmoud Eslami',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            fontFamily: "dosis",
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const SelectionArea(
            child: HomeScreen(),
          ),
        );
      });
    });
  }
}
