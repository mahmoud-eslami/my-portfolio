import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_portfolio/core/extensions/margin_extension.dart';
import 'package:flutter_portfolio/core/extensions/numbers_extension.dart';
import 'package:flutter_portfolio/core/utils/size_util.dart';
import 'package:flutter_portfolio/features/home/data/model/home_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/home_provider.dart';

class ProjectsOverviewWidget extends HookConsumerWidget {
  const ProjectsOverviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(homeDataProvider).isLoading;
    final data = ref.watch(homeDataProvider).data;

    return isLoading
        ? Container()
        : SizedBox(
            width: getProjectsSectionFixedWidth(context),
            child: Column(
              children: [
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: isMobile(context) ? 1 : 2,
                  // set two items in each row
                  childAspectRatio: 2 / 2,
                  // set custom aspect ratio (width/height)
                  children: List.generate(
                    data.projects!.length,
                    (index) => ProjectItem(
                      item: data.projects![index],
                    ),
                  ),
                ),
                100.heightSizedBox,
              ],
            ),
          );
  }
}

class ProjectItem extends HookConsumerWidget {
  const ProjectItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ProjectItemData item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = useState(false);

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    if (screenWidth < 1200) {
      return GestureDetector(
        onTap: () {
          js.context.callMethod('open', [item.link!]);
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Image.network(
                item.banner!,
                fit: BoxFit.cover,
              ),
            ),
            AnimatedContainer(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.all(20),
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black87,
                  Colors.black54,
                  Colors.black45,
                  Colors.black38,
                  Colors.transparent,
                ],
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    item.title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  10.heightSizedBox,
                  Text(
                    item.description!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ).withHorizontalMargin(20).withVerticalMargin(30),
            ),
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          js.context.callMethod('open', [item.link!]);
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) {
            isHovered.value = true;
          },
          onExit: (event) {
            isHovered.value = false;
          },
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Image.network(
                  item.banner!,
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedContainer(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.all(20),
                duration: const Duration(milliseconds: 300),
                color: isHovered.value
                    ? Colors.black26.withOpacity(.9)
                    : Colors.transparent,
                child: Visibility(
                  visible: isHovered.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                      10.heightSizedBox,
                      Text(
                        item.description!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ).withHorizontalMargin(20),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
