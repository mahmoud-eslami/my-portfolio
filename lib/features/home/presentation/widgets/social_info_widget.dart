import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portfolio/core/constant/app_colors.dart';
import 'package:flutter_portfolio/core/extensions/numbers_extension.dart';

import 'package:flutter_portfolio/core/utils/size_util.dart';
import 'package:flutter_portfolio/features/home/data/model/home_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constant/strings.dart';
import '../../provider/home_provider.dart';

class SocialInfoWidget extends HookConsumerWidget {
  const SocialInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(homeDataProvider).isLoading;
    final data = ref.watch(homeDataProvider).data;

    return isLoading
        ? Container()
        : SizedBox(
            width: getComponentFixedWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.socialTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.fontColor,
                  ),
                ),
                50.heightSizedBox,
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    data.socials!.length,
                    (index) => SocialItem(
                      socialData: data.socials![index],
                    ),
                  ).toList(),
                ),
                120.heightSizedBox,
              ],
            ),
          );
  }
}

class SocialItem extends HookWidget {
  const SocialItem({required this.socialData, super.key});

  final SocialItemData socialData;

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            socialData.name!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.fontColor.withOpacity(.7),
              fontStyle: FontStyle.italic,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 1,
                height: .2,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              js.context.callMethod('open', [socialData.link]);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (event) {
                isHovered.value = true;
              },
              onExit: (event) {
                isHovered.value = false;
              },
              child: Text(
                socialData.username!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.linkFontColor,
                  decoration: isHovered.value
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
