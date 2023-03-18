import 'package:flutter/material.dart';
import 'package:flutter_portfolio/features/home/presentation/widgets/social_info_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          SocialInfoWidget(),
        ],
      ),
    );
  }
}
