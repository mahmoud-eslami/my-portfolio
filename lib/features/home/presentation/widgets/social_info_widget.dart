import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portfolio/features/home/data/model/home_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/home_provider.dart';

class SocialInfoWidget extends HookConsumerWidget {
  const SocialInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1200),
      lowerBound: 0,
      upperBound: 1,
    );

    final isLoading = ref.watch(homeDataProvider).isLoading;
    final data = ref.watch(homeDataProvider).data;
    useEffect(() {
      if (isLoading == false) {
        animationController.forward();
      }
      return;
    });

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : FadeTransition(
            opacity: animationController,
            child: Column(
              children: [
                FadeTransition(
                  opacity: animationController,
                  child: Text("I am on social"),
                ),
                ListView(
                  shrinkWrap: true,
                  children: List.generate(
                    data.socials!.length,
                    (index) => SocialItem(socialData: data.socials![index]),
                  ).toList(),
                ),
              ],
            ),
          );
  }
}

class SocialItem extends StatelessWidget {
  const SocialItem({required this.socialData, super.key});

  final SocialItemData socialData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(socialData.name!),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: 200,
            height: 1,
            color: Colors.black,
          ),
        ),
        Text(
          socialData.username!,
          style: const TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}
