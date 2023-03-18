import 'package:flutter/material.dart';
import 'package:flutter_portfolio/features/home/presentation/view/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/constant/strings.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.crimsonText().fontFamily,
      ),
      home: const HomePage(),
    );
  }
}
