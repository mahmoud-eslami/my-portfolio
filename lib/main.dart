import 'package:flutter/material.dart';
import 'package:flutter_portfolio/di.dart';

import 'core/router/go_router_config.dart';

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
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          title: 'Mahmoud Eslami',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            fontFamily: "dosis",
            scaffoldBackgroundColor: Colors.white,
          ),
        );
      });
    });
  }
}
