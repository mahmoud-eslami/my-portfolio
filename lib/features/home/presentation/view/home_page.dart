import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portfolio/features/home/presentation/widgets/about_me_widget.dart';
import 'package:flutter_portfolio/features/home/presentation/widgets/copyright_widget.dart';
import 'package:flutter_portfolio/features/home/presentation/widgets/experiences_widget.dart';
import 'package:flutter_portfolio/features/home/presentation/widgets/projects_overview_widget.dart';
import 'package:flutter_portfolio/features/home/presentation/widgets/social_info_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/home_provider.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1200),
      lowerBound: 0,
      upperBound: 1,
    );

    final isLoading = ref.watch(homeDataProvider).isLoading;

    useEffect(() {
      if (isLoading == false) {
        animationController.forward();
      }
      return;
    });
    return SelectionArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FadeTransition(
            opacity: animationController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AboutMeWidget(),
                Center(child: ProjectsOverviewWidget()),
                ExperiencesWidget(),
                SocialInfoWidget(),
                CopyRightWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
