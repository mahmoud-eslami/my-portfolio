import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/extensions/margin_extension.dart';
import 'package:flutter_portfolio/core/extensions/numbers_extension.dart';
import 'package:flutter_portfolio/core/utils/size_util.dart';

import 'package:flutter_portfolio/features/home/data/model/home_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/strings.dart';
import '../../provider/home_provider.dart';

class ExperiencesWidget extends HookConsumerWidget {
  const ExperiencesWidget({
    Key? key,
  }) : super(key: key);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.pastPresent,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: AppColors.fontColor,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          js.context
                              .callMethod('open', [data.socials![1].link]);
                        },
                        icon: const Icon(Icons.link)),
                  ],
                ),
                50.heightSizedBox,
                ListView(
                  shrinkWrap: true,
                  children: List.generate(
                    data.experiences!.length,
                    (index) => ExperienceItem(
                      item: data.experiences![index],
                    ),
                  ).toList(),
                ),
                100.heightSizedBox,
              ],
            ),
          );
  }
}

class ExperienceItem extends HookConsumerWidget {
  const ExperienceItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ExperienceItemData item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .3,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  item.companyName!,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.fontColor,
                  ),
                ),
                Container(
                  width: 20,
                  height: .2,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  color: AppColors.fontColor.withOpacity(.8),
                ),
                Text(
                  item.role!,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.fontColor.withOpacity(.6),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    width: 1,
                  ),
                ),
                Text(
                  item.date!,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: AppColors.fontColor.withOpacity(.65),
                  ),
                ),
              ],
            ),
            10.heightSizedBox,
            Text(
              item.description!,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.fontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
