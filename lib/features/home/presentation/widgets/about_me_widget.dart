import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portfolio/core/extensions/margin_extension.dart';
import 'package:flutter_portfolio/core/extensions/numbers_extension.dart';
import 'package:flutter_portfolio/core/utils/size_util.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/utils/assets_path_generator.dart';
import '../../provider/home_provider.dart';

class AboutMeWidget extends HookConsumerWidget {
  const AboutMeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(homeDataProvider).isLoading;
    final data = ref.watch(homeDataProvider).data;

    return isLoading
        ? Container()
        : SizedBox(
            width: getComponentFixedWidth(context),
            child: Column(
              children: [
                50.heightSizedBox,
                const NerdLottieAnimation(),
                10.heightSizedBox,
                Text(
                  data.mainTitle!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.fontColor,
                  ),
                ),
                50.heightSizedBox,
                Text(
                  data.aboutMe!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColors.fontColor,
                  ),
                ),
                50.heightSizedBox,
              ],
            ),
          );
  }
}

class NerdLottieAnimation extends HookConsumerWidget {
  const NerdLottieAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      lowerBound: 1,
      upperBound: 1.2,
    );
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        animationController.forward();
      },
      onExit: (event) {
        animationController.reverse();
      },
      child: ScaleTransition(
        scale: animationController,
        child: Lottie.asset(
          alignment: Alignment.center,
          width: 200,
          assetsPathGenerator('images/fnerd.json'),
        ),
      ),
    );
  }
}
